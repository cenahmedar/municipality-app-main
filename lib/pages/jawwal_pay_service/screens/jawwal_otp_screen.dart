import 'package:flutter/material.dart';
import 'package:municipality_app/pages/jawwal_pay_service/screens/payment_status_screen.dart';
import '../../../models/iawwalpay_otp_request.dart';
import '../../../models/jawwalpay_verify_otp_request.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../services/jawwal_pay_service.dart';
import '../../../utils/colors.dart';
import '../../../utils/snackbar.dart';
import '../widgets/jawwal_enter_otp_widget.dart';
import '../widgets/jawwal_logo_widget.dart';
import '../widgets/jawwal_payment_info_widget.dart';
import 'jawwal_pay_page.dart';

/// verification code screen
class JawwalOtpPage extends StatefulWidget {
  final JawwalPayArgs jawwalVerifyOtpArgs;

  JawwalOtpPage({required this.jawwalVerifyOtpArgs});

  @override
  State<JawwalOtpPage> createState() => _JawwalOtpPageState();
}

class _JawwalOtpPageState extends State<JawwalOtpPage> {
  bool isLoading = false;
  JawwalPayService _jawwalPayService = JawwalPayService();

  Future<void> onSubmitClick(String code) async {
    FocusManager.instance.primaryFocus?.unfocus();
    var response = await _jawwalPayService.verifyJawwalPayOtp(
      JawwalVerifyOtpRequest(
        amount: widget.jawwalVerifyOtpArgs.amount,
        id: widget.jawwalVerifyOtpArgs.id,
        mobileNo: widget.jawwalVerifyOtpArgs.mobileNo,
        otpCode: code,
        paymentType: widget.jawwalVerifyOtpArgs.paymentType.toString().split('.').last,
      ),
    );

    setState(() {
      isLoading = false;
    });

    if (response == null) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => PaymentStatusScreen(
          paymentStatusArgs: PaymentStatusArgs(response.result, '',
              response.status != 1, widget.jawwalVerifyOtpArgs.id),
        ),
      ),
    );
  }

  Future<void> resendCodeClick() async {
    setState(() {
      isLoading = true;
    });
    var response = await _jawwalPayService.getJawwalPayOtp(JawwalPayOtpRequest(
      mobileNo: widget.jawwalVerifyOtpArgs.mobileNo,
      amount: widget.jawwalVerifyOtpArgs.amount.toString(),
    ));
    if (response == null) return;

    setState(() {
      isLoading = false;
    });

    if (response.status != true)
      SnackbarUtil.showSnackbar(context, message: response.result ?? '');
    else
      SnackbarUtil.showSnackbar(context,
          message: "تم ارسال الرمز التحقق مرة اخرى");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            JawwalLogo(),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: AppMargin.m16),
              child: Text(
                "تأكيد عملية الدفع",
                style: getBoldTextStyle().copyWith(
                  fontSize: FontSize.s18,
                ),
              ),
            ),
            SizedBox(
              height: AppSize.s4,
            ),
            JawwalPaymentInfo(
              amount: widget.jawwalVerifyOtpArgs.amount.toString(),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: AppMargin.m8, horizontal: AppMargin.m16),
              child: Divider(
                height: 0.2,
                color: JDivider,
              ),
            ),
            JawwalEnterOtp((code) {
              onSubmitClick(code);
            }, () {
              resendCodeClick();
            }, () {
              Navigator.of(context).pop();
            }, isLoading)
          ],
        ),
      ),
    );
  }
}
