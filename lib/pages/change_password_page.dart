import 'package:flutter/material.dart';
import 'package:municipality_app/common/widgets/buttons/cta_button.dart';
import 'package:municipality_app/constants/regex.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/pages/success_page.dart';
import 'package:municipality_app/services/user_service.dart';
import 'package:municipality_app/utils/snackbar.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

class ChangePasswordPage extends StatefulWidget {
  final bool isForgetPassword;
  final String? idNumber;
  final String? verificationCode;
  ChangePasswordPage({
    this.isForgetPassword = false,
    this.idNumber,
    this.verificationCode,
  });
  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final UserService _userService = UserService();
  Map<String, String> _inputs = {
    "newPassword": "",
    "newPasswordAgain": "",
    "oldPassword": "",
  };
  Widget _getTextField({
    required String hint,
    required String key,
    TextAlign textAlign = TextAlign.start,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFB0B0B0),
          ),
        ),
      ),
      child: TextField(
        onChanged: (String newValue) {
          setState(() {
            _inputs = {..._inputs, key: newValue};
          });
        },
        obscureText: true,
        cursorHeight: 18,
        textAlign: textAlign,
        cursorColor: Color(0xFFB0B0B0),
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFFB0B0B0),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Color(0xFFB0B0B0),
          ),
          contentPadding: EdgeInsets.only(bottom: 1),
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }

  bool getCanClick() {
    return passwordRegex.hasMatch(_inputs['newPassword'] ?? '') &&
        _inputs['newPassword'] == _inputs['newPasswordAgain'] &&
        (widget.isForgetPassword || _inputs['oldPassword']?.trim() != '');
  }

  void _navigateToSuccessPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SuccessPage(
          ctaButtonText: I18n.of(context)!.back_to_home_screen,
          ctaButtonOnClick: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
          successMessage: I18n.of(context)!.password_changed_successfully,
          appBarTitle: I18n.of(context)!.change_password,
        ),
      ),
    );
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
        title: I18n.of(context)!.change_password,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 8,
                ),
                child: Text(
                  I18n.of(context)!.password_rules,
                  textAlign: TextAlign.center,
                ),
              ),
              widget.isForgetPassword == false
                  ? _getTextField(
                      hint: I18n.of(context)!.current_password,
                      key: 'oldPassword',
                    )
                  : SizedBox(),
              _getTextField(
                hint: I18n.of(context)!.new_password,
                key: 'newPassword',
              ),
              _getTextField(
                hint: I18n.of(context)!.new_password_again,
                key: 'newPasswordAgain',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: CTAButton(
                  mainColor: Theme.of(context).primaryColor,
                  label: I18n.of(context)!.change_password,
                  onPressed: getCanClick()
                      ? () async {
                          try {
                            bool result;
                            if (widget.isForgetPassword) {
                              _inputs['idNumber'] = widget.idNumber!;
                              _inputs['verificationCode'] =
                                  widget.verificationCode!;
                              _inputs['confirmPassword'] =
                                  _inputs['newPasswordAgain'] ?? '';

                              result =
                                  await _userService.forgotPassword(_inputs);
                            } else {
                              result =
                                  await _userService.changePassword(_inputs);
                            }
                            if (result) {
                              _navigateToSuccessPage();
                            }
                          } catch (exp) {
                            SnackbarUtil.showSnackbar(context,
                                message:
                                    'There was an issue resetting password');
                          }
                        }
                      : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
