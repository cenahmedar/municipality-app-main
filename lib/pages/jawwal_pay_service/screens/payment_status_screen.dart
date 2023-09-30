import 'package:flutter/material.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../utils/colors.dart';
import '../widgets/jawwal_logo_widget.dart';

class PaymentStatusScreen extends StatefulWidget {
  final PaymentStatusArgs paymentStatusArgs;

  const PaymentStatusScreen({required this.paymentStatusArgs});

  @override
  State<PaymentStatusScreen> createState() => _PaymentStatusScreenState();
}

class _PaymentStatusScreenState extends State<PaymentStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: JawwalLogo(),
              margin: EdgeInsets.symmetric(vertical: AppMargin.m28),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: AppMargin.m4),
              alignment: Alignment.center,
              child: Text(widget.paymentStatusArgs.title!,
                  style: getMediumTextStyle().copyWith(
                      color: widget.paymentStatusArgs.isApproved!
                          ? JGreen
                          : JRedColor)),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: AppMargin.m8, horizontal: AppMargin.m20),
              alignment: Alignment.center,
              child: Text(widget.paymentStatusArgs.msg!,
                  style: getMediumTextStyle()
                      .copyWith(fontWeight: FontWeight.w100),
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: AppSize.s18,
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(vertical: 0, horizontal: AppMargin.m8),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/jawwal_reactangle.png',
                      fit: BoxFit.contain,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          AppSize.s0, AppSize.s0, AppSize.s0, AppSize.s12),
                      child: Text(
                        "إنهاء",
                        style: getTextStyle(Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PaymentStatusArgs {
  final String? msg;
  final String? title;
  final bool? isApproved;
  final String? formId;

  PaymentStatusArgs(this.msg, this.title, this.isApproved, this.formId);
}
