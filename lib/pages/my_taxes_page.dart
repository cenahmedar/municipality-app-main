import 'package:flutter/material.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/tax.dart';
import 'package:municipality_app/services/bills_service.dart';
import 'package:municipality_app/services/jawwal_pay_service.dart';
import 'package:municipality_app/widgets/money_amount_card.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

import 'jawwal_pay_service/screens/jawwal_pay_page.dart';

class MyTaxesPage extends StatefulWidget {
  @override
  State<MyTaxesPage> createState() => _MyTaxesPageState();
}

class _MyTaxesPageState extends State<MyTaxesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Tax> _taxes = [];
  BillsService _billsService = BillsService();
  bool _loading = true;
  JawwalPayService _jawwalPayService = JawwalPayService();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        _taxes = await _billsService.getTaxes() ?? [];
        setState(() {
          _loading = false;
        });
      } catch (exp) {
        setState(() {
          _loading = false;
          _taxes = [];
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
        title: I18n.of(context)!.taxes,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 22,
            horizontal: 16,
          ),
          child: _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _taxes.length == 0
                  ? SizedBox()
                  : CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            List.generate(
                              _taxes.length,
                              (index) => MoneyAmountCardWidget(
                                amount: _taxes[index].taxAmount.toString(),
                                titleValue: _taxes[index].taxName,
                                sourcePage: I18n.of(context)!.my_bills,
                                onClick: () async {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => JawwalPayPage(
                                        jawwalPayArgs: JawwalPayArgs(
                                          paymentType: PaymentType.TAX,
                                          id: _taxes[index].ptid,
                                          amount: _taxes[index].taxAmount,
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
