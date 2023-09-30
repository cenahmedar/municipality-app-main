import 'package:flutter/material.dart';

import '../../../models/iawwalpay_otp_request.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../services/jawwal_pay_service.dart';
import '../../../utils/colors.dart';
import '../../../utils/formatter.dart';
import '../../../utils/logs.dart';
import '../../../utils/snackbar.dart';
import '../widgets/jawwal_logo_widget.dart';
import 'jawwal_otp_screen.dart';

class JawwalPayPage extends StatefulWidget {
  final JawwalPayArgs jawwalPayArgs;

  JawwalPayPage({
    required this.jawwalPayArgs,
  });

  @override
  State<JawwalPayPage> createState() => _JawwalPayPageState();
}

class _JawwalPayPageState extends State<JawwalPayPage> {
  bool isLoading = false;
  JawwalPayService _jawwalPayService = JawwalPayService();

  void loadingState() {
    setState(() {
      isLoading = true;
    });
  }

  void onSubmitClick(TextEditingController _phoneNumberController) async {
    if (_phoneNumberController.text.isEmpty) {
      SnackbarUtil.showSnackbar(context, message: "يرجى ادخال رقم الجوال");
      return;
    }
    if (_phoneNumberController.text.length != 8) {
      SnackbarUtil.showSnackbar(context,
          message: "يرجى ادخال رقم الجوال بشكل صحيح");
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    loadingState();
    var _mobileNo = "009705${replaceFarsiNumber(_phoneNumberController.text)}";

    var response = await _jawwalPayService.getJawwalPayOtp(JawwalPayOtpRequest(
      mobileNo: _mobileNo,
      amount: widget.jawwalPayArgs.amount.toString(),
    ));
    if (response == null) return;
    if (response.status != true) {
      SnackbarUtil.showSnackbar(context, message: response.result ?? '');
      setState(() {
        isLoading = false;
      });
      return;
    }

    widget.jawwalPayArgs.mobileNo = _mobileNo;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => JawwalOtpPage(
                jawwalVerifyOtpArgs: widget.jawwalPayArgs,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    printLog("[JawwalPayScreen] ${widget.jawwalPayArgs.amount}");
    final TextEditingController _phoneNumberController =
        TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            JawwalLogo(),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                      vertical: AppSize.s28, horizontal: AppSize.s26),
                  child: TextFormField(
                    controller: _phoneNumberController,
                    maxLines: 1,
                    autofocus: true,
                    textDirection: TextDirection.ltr,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: JTeal9C,
                    maxLength: 8,
                    style: getMediumTextStyle(),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      counterText: "",
                      focusColor: JTeal61,
                      labelText: "ادخل رقم الجوال",
                      alignLabelWithHint: false,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s26),
                        borderSide:
                            const BorderSide(color: JTeal61, width: 1.0),
                      ),
                      labelStyle: getLabelTextStyle(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s26),
                        borderSide:
                            const BorderSide(color: JTeal61, width: 1.0),
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: AppSize.s40,
                            width: AppSize.s4 - 2,
                            color: JWhiteCC,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(AppSize.s16, AppSize.s0,
                                AppSize.s16, AppSize.s4),
                            child: Text(
                              '05',
                              style: getMediumTextStyle(),
                            ),
                          )
                        ],
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: JTeal61, width: 1.5),
                        borderRadius: BorderRadius.circular(AppSize.s26),
                      ),
                      hintStyle: getHintTextStyle(),
                      enabled: true,
                      hintText: "ادخل رقم الجوال",
                      hintTextDirection: TextDirection.ltr,
                    ),
                  ),
                ),
                isLoading
                    ? Container(
                        margin: EdgeInsets.all(AppMargin.m4),
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: JGreen,
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          onSubmitClick(_phoneNumberController);
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/jawwal_reactangle.png',
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(AppSize.s0,
                                  AppSize.s0, AppSize.s0, AppSize.s12),
                              child: Text(
                                "أرسل رمز التحقق",
                                style: getTextStyle(Colors.white),
                              ),
                            )
                          ],
                        )),
                SizedBox(
                  height: AppSize.s18,
                ),
                Visibility(
                  visible: false,
                  child: Container(
                    child: Text(
                      "ليس لديك محفظة Jawwal Pay؟",
                      style: getTextStyle(dTextColor),
                    ),
                  ),
                ),
                Visibility(
                  visible: false,
                  child: InkWell(
                    onTap: () {
                      printLog("Register Now");
                    },
                    child: Text(
                      "سجل الان",
                      style: getTextStyle(JGreen),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum PaymentType { TAX, BILL, FORM }

class JawwalPayArgs {
  String? id;
  double? amount;
  PaymentType paymentType;
  String? mobileNo;

  JawwalPayArgs(
      {required this.paymentType, this.id, this.amount, this.mobileNo});
}
