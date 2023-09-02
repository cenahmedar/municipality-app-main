import 'package:flutter/material.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/bill.dart';
import 'package:municipality_app/pages/jawwal_pay_page.dart';
import 'package:municipality_app/services/bills_service.dart';
import 'package:municipality_app/services/jawwal_pay_service.dart';
import 'package:municipality_app/utils/snackbar.dart';
import 'package:municipality_app/widgets/money_amount_card.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

class MyBillsPage extends StatefulWidget {
  @override
  State<MyBillsPage> createState() => _MyBillsPageState();
}

class _MyBillsPageState extends State<MyBillsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Bill> _bills = [];
  BillsService _billsService = BillsService();
  JawwalPayService _jawwalPayService = JawwalPayService();

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
                                  setState(() {
                                    _loading = true;
                                  });
                                  String? paymentKey =
                                      await _jawwalPayService.payBill(
                                          amount: _bills[index]
                                              .invoiceAmount
                                              .toString(),
                                          billId:
                                              _bills[index].invoiceNo ?? '');
                                  setState(() {
                                    _loading = false;
                                  });
                                  if (paymentKey != null) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => JawwalPayPage(
                                          paymentKey: paymentKey,
                                          invoiceNo: _bills[index].invoiceNo,
                                        ),
                                      ),
                                    );

                                    return;
                                  }

                                  SnackbarUtil.showSnackbar(context,
                                      message: I18n.of(context)!
                                          .there_was_an_issue_try_again_later);
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
