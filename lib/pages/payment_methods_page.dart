import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:municipality_app/common/widgets/buttons/cta_button.dart';
import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/payment_method.dart';
import 'package:municipality_app/pages/success_page.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';
import 'package:municipality_app/widgets/payment_logo_badge.dart';

class PaymentMethodsPage extends StatefulWidget {
  final double? amountToPay;
  final String? currency;
  final String? sourcePage;
  PaymentMethodsPage({
    this.amountToPay,
    this.currency,
    this.sourcePage,
  });
  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<PaymentMethod> paymentMethods =
      PaymentMethod.getAllPaymentMethods();
  TextEditingController _amountToPayController = TextEditingController();

  PaymentMethodType _selectedType = PaymentMethodType.JAWALPAY;

  Widget getPaymentCard(PaymentMethod paymentMethod) {
    return GestureDetector(
      onTap: () => setState(() {
        _selectedType = paymentMethod.type;
      }),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFB6C6D4),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(1, 1),
            ),
          ],
        ),
        margin: EdgeInsets.only(
          bottom: 30,
          left: 30,
          right: 30,
        ),
        child: Row(
          children: [
            PaymentLogoBadge(paymentMethod: paymentMethod),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                '1234242323423',
              ),
            ),
            paymentMethod.type == _selectedType
                ? SvgPicture.asset('assets/icons/step_done.svg')
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  TextStyle? getAmountToBePaidSubtitle() {
    return Theme.of(context).textTheme.caption?.copyWith(
          fontSize: 13.0,
          color: Color(0xFFB0B0B0),
        );
  }

  List<Widget> _getAmountToBePaidTextField() {
    if (widget.amountToPay == null || widget.amountToPay == 0) {
      return [];
    }

    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                I18n.of(context)!.please_enter_the_amount_you_want_to_pay,
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    I18n.of(context)!.amount_due_is,
                    style: getAmountToBePaidSubtitle(),
                  ),
                  SizedBox(width: 2),
                  Text(
                    widget.amountToPay.toString(),
                    style: getAmountToBePaidSubtitle(),
                  ),
                  SizedBox(width: 2),
                  Text(
                    widget.currency ?? '',
                    style: getAmountToBePaidSubtitle(),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFB0B0B0),
                    ),
                  ),
                ),
                child: TextField(
                  controller: _amountToPayController,
                  onChanged: (String value) {
                    setState(() {});
                  },
                  textAlign: TextAlign.start,
                  cursorColor: Color(0xFFB0B0B0),
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFB0B0B0),
                  ),
                  decoration: InputDecoration(
                    hintText: 'xxxx',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFB0B0B0),
                    ),
                    contentPadding: EdgeInsets.only(bottom: 1),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ];
  }

  _onPayClicked() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SuccessPage(
          successMessage: I18n.of(context)!.payment_executed_successfully,
          ctaButtonText: I18n.of(context)!.back_to_home_screen,
          ctaButtonOnClick: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
          appBarTitle: widget.sourcePage ?? '',
        ),
      ),
    );
  }

  List<Widget> getPayAmountButton() {
    if (widget.amountToPay == null || widget.amountToPay == 0) {
      return [];
    }

    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CTAButton(
            height: 45,
            label: I18n.of(context)!.pay,
            mainColor: Theme.of(context).primaryColor,
            onPressed:
                _amountToPayController.text.trim() == '' ? null : _onPayClicked,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      appBar: MainAppBarWidget(
        scaffoldKey: _scaffoldKey,
        title: I18n.of(context)!.payments_methods,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 30,
          ),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              ..._getAmountToBePaidTextField(),
              SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(paymentMethods.length, (index) {
                    return getPaymentCard(paymentMethods[index]);
                  }).toList(),
                ),
              ),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(Routes.ADD_PAYMENT_METHOD),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        I18n.of(context)!.add_another_payment_method,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 17.0,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              ...getPayAmountButton(),
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 16,
              //       vertical: 16,
              //     ),
              //     child: CTAButton(
              //       label: I18n.of(context)!.pay_and_finish_application,
              //       onPressed: () => Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => SuccessPage(
              //             appBarTitle: I18n.of(context)!.payments_methods,
              //             successMessage:
              //                 I18n.of(context)!.payment_executed_successfully,
              //             ctaButtonText: I18n.of(context)!.back_to_home_screen,
              //             ctaButtonOnClick: () => Navigator.popUntil(
              //               context,
              //               ModalRoute.withName(Routes.HOMEPAGE),
              //             ),
              //           ),
              //         ),
              //       ),
              //       mainColor: Theme.of(context).primaryColor,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
