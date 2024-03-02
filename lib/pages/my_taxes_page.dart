import 'package:flutter/material.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/tax.dart';
import 'package:municipality_app/services/bills_service.dart';
import 'package:municipality_app/services/jawwal_pay_service.dart';
import 'package:municipality_app/widgets/money_amount_card.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

import '../widgets/bills_filter_card.dart';
import 'jawwal_pay_service/screens/jawwal_pay_page.dart';

class MyTaxesPage extends StatefulWidget {
  @override
  State<MyTaxesPage> createState() => _MyTaxesPageState();
}

class _MyTaxesPageState extends State<MyTaxesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  List<Tax> _filteredTaxes = [];
  List<Tax> _taxes = [];
  List<String?> _serviceNos = [];
  BillsService _billsService = BillsService();
  bool _loading = true;
  JawwalPayService _jawwalPayService = JawwalPayService();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        _taxes = await _billsService.getTaxes() ?? [];
        _filteredTaxes = _taxes;
        _serviceNos = _taxes.map((i) => i.serviceNo).toSet().toList();
        setState(() {
          _loading = false;
        });
      } catch (exp) {
        setState(() {
          _loading = false;
          _taxes = [];
          _filteredTaxes = [];
        });
      }
    });
    super.initState();
  }

  void onChange(String? value) {
    setState(() {
      if (value == null)
        _filteredTaxes = _taxes;
      else
        _filteredTaxes = _taxes.where((i) => i.serviceNo == value).toList();

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
              : _filteredTaxes.length == 0
                  ? SizedBox()
                  : Column(
                      children: [
                        BillsFilterCard(
                            dropdownItems: _serviceNos, onChanged: onChange),
                        Expanded(
                          child: CustomScrollView(
                            physics: BouncingScrollPhysics(),
                            slivers: [
                              SliverList(
                                delegate: SliverChildListDelegate(
                                  List.generate(
                                    _filteredTaxes.length,
                                    (index) => MoneyAmountCardWidget(
                                      amount: _filteredTaxes[index]
                                          .taxAmount
                                          .toString(),
                                      titleValue: _filteredTaxes[index].taxName,
                                      serviceNo:
                                          _filteredTaxes[index].serviceNo,
                                      sourcePage: I18n.of(context)!.my_bills,
                                      onClick: () async {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => JawwalPayPage(
                                              jawwalPayArgs: JawwalPayArgs(
                                                paymentType: PaymentType.TAX,
                                                id: _filteredTaxes[index].ptid,
                                                amount: _filteredTaxes[index]
                                                    .taxAmount,
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
