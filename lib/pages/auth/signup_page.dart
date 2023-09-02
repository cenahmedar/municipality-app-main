import 'package:flutter/material.dart';
import 'package:municipality_app/change_notifiers/user_change_notifier.dart';

import 'package:municipality_app/common/widgets/buttons/cta_loading_button.dart';
import 'package:municipality_app/common/widgets/input/custom_input_text.dart';
import 'package:municipality_app/constants/regex.dart';
import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/environments/config/config.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/signup_model.dart';
import 'package:municipality_app/models/user.dart';
import 'package:municipality_app/pages/auth/verification_page.dart';
import 'package:municipality_app/utils/snackbar.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmedPasswordController =
      TextEditingController();

  String? _validationMessage;
  bool _isLoading = false;
  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _confirmedPasswordController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    Config? config = FlavorConfig.instance?.config;
    return GestureDetector(
      onTap: () => {}, // Tools.hideKeyboard(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CustomScrollView(
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              slivers: [
                SliverToBoxAdapter(
                  child: Image.asset(
                    config?.logo ?? '',
                    height: 120,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 24),
                ),
                SliverToBoxAdapter(
                  child: _buildInput(
                    I18n.of(context)!.username,
                    TextInputType.name,
                    _nameController,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 8),
                ),
                SliverToBoxAdapter(
                  child: _buildInput(
                    I18n.of(context)!.id_number,
                    TextInputType.number,
                    _usernameController,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 8),
                ),
                SliverToBoxAdapter(
                  child: _buildInput(
                    I18n.of(context)!.phone_number,
                    TextInputType.phone,
                    _phoneController,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 8),
                ),
                SliverToBoxAdapter(
                  child: _buildInput(
                    I18n.of(context)!.password,
                    TextInputType.visiblePassword,
                    _passwordController,
                    obscureText: true,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 8),
                ),
                SliverToBoxAdapter(
                  child: _buildInput(
                    I18n.of(context)!.confirm_password,
                    TextInputType.visiblePassword,
                    _confirmedPasswordController,
                    obscureText: true,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 16),
                ),
                SliverToBoxAdapter(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: I18n.of(context)!.terms_conditions_message,
                      style: Theme.of(context).textTheme.caption,
                      children: <TextSpan>[
                        TextSpan(
                            text: I18n.of(context)!.terms_conditions,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 16),
                ),
                SliverToBoxAdapter(
                  child: CTALoadingButton(
                    label: I18n.of(context)!.register,
                    mainColor: Theme.of(context).primaryColor,
                    onPressed: _signUp,
                    isCompleteAction: !_isLoading,
                  ),
                ),
                SliverToBoxAdapter(
                  child: _validationMessage != null
                      ? Text(
                          _validationMessage!,
                          style: TextStyle(color: Colors.red),
                        )
                      : SizedBox(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? getValidationMessage() {
    if (_nameController.text.trim() == '' ||
        _usernameController.text.trim() == '' ||
        _phoneController.text.trim() == '' ||
        _passwordController.text.trim() == '' ||
        _confirmedPasswordController.text.trim() == '') {
      return I18n.of(context)!.missing_inputs;
    }
    if (!passwordRegex.hasMatch(_passwordController.text)) {
      return I18n.of(context)!.password_rules;
    }
    if (_passwordController.text.trim() !=
        _confirmedPasswordController.text.trim()) {
      return I18n.of(context)!.passwords_not_match;
    }
    return null;
  }

  void _signUp() async {
    String? checkValidationMessage = getValidationMessage();
    if (checkValidationMessage != null) {
      setState(() {
        _validationMessage = checkValidationMessage;
      });
      return;
    }
    _validationMessage = null;
    final name = _nameController.text;
    final username = _usernameController.text;
    final phone = _phoneController.text;
    final password = _passwordController.text;
    final confirmedPassword = _confirmedPasswordController.text;

    SignUpModel signUpModel =
        SignUpModel(name, username, phone, password, confirmedPassword);
    setState(() {
      _isLoading = true;
    });
    User? user = await context
        .read<UserChangeNotifier>()
        .signupUser(signUpModel: signUpModel);
    setState(() {
      _isLoading = false;
    });
    if (user != null) {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => VerificationPage(
            idNumber: user.idCarNumber!,
            goBackButtonText: I18n.of(context)!.change_phone_number,
            onVerificationSuccess: (String idNumber, String key) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.HOMEPAGE, (route) => true);
            },
          ),
        ),
      );
    } else {
      SnackbarUtil.showSnackbar(
        context,
        message: 'There was an issue registering',
      );
    }
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
