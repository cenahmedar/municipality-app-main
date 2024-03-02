import 'package:flutter/material.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/bill.dart';
import 'package:municipality_app/services/bills_service.dart';
import 'package:municipality_app/widgets/money_amount_card.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

import '../widgets/bills_filter_card.dart';
import 'jawwal_pay_service/screens/jawwal_pay_page.dart';

class MyBillsPage extends StatefulWidget {
  @override
  State<MyBillsPage> createState() => _MyBillsPageState();
}

class _MyBillsPageState extends State<MyBillsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  List<Bill> _filteredBills = [];
  List<Bill> _bills = [];
  List<String?> _serviceNos = [];
  BillsService _billsService = BillsService();
  bool _loading = true;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        _bills = await _billsService.getBills() ?? [];
        _filteredBills = _bills;
        _serviceNos = _bills
            .where((i) => i.serviceNo != null)
            .map((i) => i.serviceNo)
            .toSet()
            .toList();
        setState(() {
          _loading = false;
        });
      } catch (exp) {
        setState(() {
          _loading = false;
          _bills = [];
          _filteredBills = [];
        });
      }
    });
    super.initState();
  }

  void onChange(String? value) {
    setState(() {
      if (value == null)
        _filteredBills = _bills;
      else
        _filteredBills = _bills.where((i) => i.serviceNo == value).toList();

      _scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: MenuDrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      appBar: MainAppBarWidget(
        scaffoldKey: _scaffoldKey,
        title: I18n.of(context)!.my_bills,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _filteredBills.length == 0
              ? SizedBox()
              : SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 22,
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        BillsFilterCard(
                            dropdownItems: _serviceNos, onChanged: onChange),
                        Expanded(
                          child: CustomScrollView(
                            controller: _scrollController,
                            physics: BouncingScrollPhysics(),
                            slivers: [
                              SliverList(
                                delegate: SliverChildListDelegate(
                                  List.generate(
                                    _filteredBills.length,
                                    (index) => MoneyAmountCardWidget(
                                      amount: _filteredBills[index]
                                          .invoiceAmount
                                          .toString(),
                                      title: I18n.of(context)!.invoice_number,
                                      titleValue:
                                          _filteredBills[index].invoiceNo ?? '',
                                      serviceNo:
                                          _filteredBills[index].serviceNo ?? '',
                                      sourcePage: I18n.of(context)!.my_bills,
                                      onClick: () async {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => JawwalPayPage(
                                              jawwalPayArgs: JawwalPayArgs(
                                                paymentType: PaymentType.BILL,
                                                id: _filteredBills[index]
                                                    .invoiceNo,
                                                amount: _filteredBills[index]
                                                    .invoiceAmount,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}

class DropdownHeader extends SliverPersistentHeaderDelegate {
  final Widget child;

  DropdownHeader({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 100.0; // Adjust the height of the header

  @override
  double get minExtent => 100.0; // Adjust the height of the header

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
