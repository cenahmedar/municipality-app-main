import 'package:flutter/material.dart';
// import 'package:municipality_app/previous/core/utils/tools.dart';
// import 'package:municipality_app/previous/generated/i18n.dart';
// import 'package:municipality_app/auth/bloc/auth_bloc.dart';
// import 'package:municipality_app/common/enums/screen.dart';
// import 'package:municipality_app/common/events/base_event.dart';
// import 'package:municipality_app/common/extensions/navigator.dart';
// import 'package:municipality_app/common/states/general_state.dart';
import 'package:municipality_app/common/widgets/buttons/cta_button.dart';
import 'package:municipality_app/common/widgets/input/custom_input_text.dart';
import 'package:municipality_app/environments/config/config.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/pages/auth/verification_page.dart';
import 'package:municipality_app/pages/change_password_page.dart';
import 'package:municipality_app/services/user_service.dart';
import 'package:municipality_app/utils/snackbar.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _usernameController = TextEditingController();
  final UserService _userService = UserService();
  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    Config? config = FlavorConfig.instance?.config;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        config?.logo ?? '',
                        height: 120,
                      ),
                      SizedBox(height: 48),
                      Text(I18n.of(context)!.enter_id_number,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(fontSize: 24.0),
                          textAlign: TextAlign.center),
                      SizedBox(height: 12),
                      _buildInput(
                        I18n.of(context)!.id_number,
                        TextInputType.name,
                        _usernameController,
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
                CTAButton(
                  label: I18n.of(context)!.send_verification_code,
                  mainColor: Theme.of(context).primaryColor,
                  onPressed: () async {
                    try {
                      // bool result = await _userService
                      //     .resendVerificationCode(_usernameController.text);
                      // if (result) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => VerificationPage(
                            forgotPassword: true,
                            onVerificationSuccess:
                                (String idNumber, String code) => {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ChangePasswordPage(
                                    verificationCode: code,
                                    isForgetPassword: true,
                                    idNumber: idNumber,
                                  ),
                                ),
                              )
                            },
                            idNumber: _usernameController.text,
                            goBackButtonText:
                                I18n.of(context)!.change_phone_number_or_id,
                          ),
                        ),
                      );
                    } catch (exp) {
                      SnackbarUtil.showSnackbar(context,
                          message: 'There was an issue');
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildInput(
      String hint, TextInputType keyboardType, TextEditingController controller,
      {bool obscureText = false}) {
    return CustomInputText(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        hintText: hint);
  }
}
