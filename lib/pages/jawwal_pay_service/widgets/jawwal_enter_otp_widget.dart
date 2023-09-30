import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../utils/colors.dart';
import '../../../utils/snackbar.dart';

class JawwalEnterOtp extends StatefulWidget {
  final VoidCallback onResendCodeClick;
  final Function(String code) onConfirmButton;
  final VoidCallback onCancelVerify;
  bool isLoading;

  JawwalEnterOtp(this.onConfirmButton, this.onResendCodeClick,
      this.onCancelVerify, this.isLoading);

  @override
  State<JawwalEnterOtp> createState() => _JawwalEnterOtpState();
}

class _JawwalEnterOtpState extends State<JawwalEnterOtp> {
  FocusNode _otpFocusNode = FocusNode();
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppMargin.m28),
      child: Column(
        children: [
          Text(
            "أدخل رمز التحقق المكون من خمس خانات",
            style: getTextStyle(dTextColor).copyWith(color: JTextColor),
          ),
          boxedPinPutWithPreFilledSymbol(context),
          SizedBox(
            height: AppSize.s18,
          ),
          widget.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: JGreen,
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: InkWell(
                          onTap: () {
                            if (widget.isLoading) {
                              return;
                            }
                            loadingEnterCode();
                            widget.onCancelVerify();
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                AppMargin.m4, 0, AppMargin.m4, AppMargin.m4),
                            child: Text(
                              "إلغاء",
                              style: getTextStyle(Colors.red)
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (widget.isLoading) {
                            return;
                          }
                          if (_otpController.text.length < 5) {
                            SnackbarUtil.showSnackbar(context,
                                message: "يرجى ادخال رمز التحقق");
                            return;
                          }
                          loadingEnterCode();
                          widget.onConfirmButton(_otpController.text);
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/jawwal_reactangle.png',
                              fit: BoxFit.contain,
                              width: 275,
                            ),
                            widget.isLoading
                                ? Container(
                                    height: 20,
                                    width: 20,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.fromLTRB(AppSize.s0,
                                        AppSize.s0, AppSize.s0, AppSize.s12),
                                    child: Text("تأكيد الدفع",
                                        style: getTextStyle(Colors.white)),
                                  )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
          Visibility(
            visible: widget.isLoading == false,
            child: Container(
              margin:
                  EdgeInsets.symmetric(vertical: AppMargin.m4, horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "لم تتلقى اية رسالة.",
                    style: getTextStyle(JTextColor),
                  ),
                  SizedBox(
                    width: AppSize.s4 - 2,
                  ),
                  InkWell(
                    onTap: () {
                      widget.onResendCodeClick();
                    },
                    child: Text(
                      "ارسل مجددا؟",
                      style: getTextStyle(JGreen),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void loadingEnterCode() {
    setState(() {
      widget.isLoading = true;
    });
  }

  Widget boxedPinPutWithPreFilledSymbol(BuildContext context) {
    final BoxDecoration pinPutDecoration = BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(AppSize.s26),
        border: Border.all(color: JTeal61, width: 1.5));

    return Container(
      margin: EdgeInsets.symmetric(vertical: AppMargin.m4),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PinPut(
            eachFieldHeight: 56,
            eachFieldWidth: AppSize.s40 + 8,
            withCursor: true,
            fieldsCount: 5,
            cursorColor: JTeal74,
            textStyle: TextStyle(fontSize: 24.0, color: HexColor('#111827')),
            controller: _otpController,
            focusNode: _otpFocusNode,
            autofocus: true,
            fieldsAlignment: MainAxisAlignment.center,
            eachFieldMargin: EdgeInsets.all(4),
            submittedFieldDecoration: pinPutDecoration,
            selectedFieldDecoration: pinPutDecoration,
            followingFieldDecoration: pinPutDecoration),
      ),
    );
  }
}
