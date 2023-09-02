import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:municipality_app/change_notifiers/user_change_notifier.dart';
import 'package:municipality_app/common/widgets/buttons/cta_loading_button.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/services/user_service.dart';
import 'package:municipality_app/utils/snackbar.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';

class VerificationPage extends StatefulWidget {
  final String? goBackButtonText;
  final Function(String, String) onVerificationSuccess;
  final String idNumber;
  final bool forgotPassword;
  VerificationPage({
    this.goBackButtonText,
    required this.onVerificationSuccess,
    required this.idNumber,
    this.forgotPassword = false,
  });
  @override
  State<StatefulWidget> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  FocusNode _otpFocusNode = FocusNode();
  TextEditingController _otpController = TextEditingController();
  UserService _userService = UserService();

  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _otpFocusNode.dispose();
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      setState(() {
        _isLoading = true;
      });
      try {
        await _userService.resendVerificationCode(widget.idNumber);
      } catch (exp) {}
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                'assets/images/verification_bg.svg',
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: height * 0.3,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      I18n.of(context)!.enter_verification_code,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontSize: 24.0),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: boxedPinPutWithPreFilledSymbol(context),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 48,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      I18n.of(context)!.enter_otp_message,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: const Color(0xff7b7b7b),
                            fontSize: 17.0,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 48,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        _getResendCodeButton(),
                        widget.goBackButtonText != null
                            ? _getGoBackButton()
                            : SizedBox(),
                        SizedBox(
                          height: 48,
                        ),
                        CTALoadingButton(
                          label: I18n.of(context)!.sign_in,
                          mainColor: Theme.of(context).primaryColor,
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            bool result = await context
                                .read<UserChangeNotifier>()
                                .verifyUser(
                                  idNumber: widget.idNumber,
                                  pinCode: _otpController.text,
                                  setUserFlag: !widget.forgotPassword,
                                );

                            if (result) {
                              widget.onVerificationSuccess(
                                  widget.idNumber, _otpController.text);
                              return;
                            }
                            setState(() {
                              _isLoading = false;
                            });
                            SnackbarUtil.showSnackbar(context,
                                message: I18n.of(context)!
                                    .incorrect_verification_code);
                          },
                          isCompleteAction: !_isLoading,
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getGoBackButton() {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: _getText(widget.goBackButtonText!),
    );
  }

  Widget _getText(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption?.copyWith(
            color: const Color(0xff7b7b7b),
            fontSize: 17.0,
          ),
    );
  }

  Widget _getResendCodeButton() {
    return GestureDetector(
      onTap: () async {
        bool result =
            await _userService.resendVerificationCode(widget.idNumber);
        if (result) {
          SnackbarUtil.showSnackbar(context, message: 'success');
        } else {
          SnackbarUtil.showSnackbar(context, message: 'there was an issue');
        }
      },
      child: _getText(I18n.of(context)!.resend_verification_code),
    );
  }

  Widget boxedPinPutWithPreFilledSymbol(BuildContext context) {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(5.0),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PinPut(
          withCursor: true,
          fieldsCount: 4,
          textStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
          controller: _otpController,
          focusNode: _otpFocusNode,
          autofocus: true,
          fieldsAlignment: MainAxisAlignment.center,
          eachFieldMargin: EdgeInsets.all(10),
          submittedFieldDecoration: pinPutDecoration,
          selectedFieldDecoration: pinPutDecoration,
          followingFieldDecoration: pinPutDecoration,
        ),
      ),
    );
  }
}
