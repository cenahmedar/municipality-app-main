import 'package:flutter/material.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/bill.dart';
import 'package:municipality_app/services/bills_service.dart';
import 'package:municipality_app/services/jawwal_pay_service.dart';
import 'package:municipality_app/widgets/money_amount_card.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

import 'jawwal_pay_service/screens/jawwal_pay_page.dart';

class MyBillsPage extends StatefulWidget {
  @override
  State<MyBillsPage> createState() => _MyBillsPageState();
}

class _MyBillsPageState extends State<MyBillsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Bill> _bills = [];
  BillsService _billsService = BillsService();
  bool _loading = true;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        _bills = await _billsService.getBills() ?? [];
        setState(() {
          _loading = false;
        });
      } catch (exp) {
        setState(() {
          _loading = false;
          _bills = [];
        });
      }
    });
    super.initState();
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
          : _bills.length == 0
              ? SizedBox()
              : SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 22,
                      horizontal: 16,
                    ),
                    child: CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            List.generate(
                              _bills.length,
                              (index) => MoneyAmountCardWidget(
                                amount: _bills[index].invoiceAmount.toString(),
                                title: I18n.of(context)!.invoice_number,
                                titleValue: _bills[index].invoiceNo ?? '',
                                sourcePage: I18n.of(context)!.my_bills,
                                onClick: () async {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => JawwalPayPage(
                                        jawwalPayArgs: JawwalPayArgs(
                                          paymentType: PaymentType.BILL,
                                          id: _bills[index].invoiceNo,
                                          amount: _bills[index].invoiceAmount,
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
                ),
    );
  }
}
