import 'package:flutter/material.dart';
import 'package:municipality_app/change_notifiers/user_change_notifier.dart';
import 'package:municipality_app/common/widgets/buttons/cta_button.dart';
import 'package:municipality_app/common/widgets/buttons/cta_loading_button.dart';
import 'package:municipality_app/common/widgets/input/custom_input_text.dart';
import 'package:municipality_app/environments/config/config.dart';
import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/models/user_credentials.dart';

// import 'package:municipality_app/previous/core/utils/tools.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/utils/snackbar.dart';
import 'package:provider/provider.dart';

import '../../main/main.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    Config? config = FlavorConfig.instance?.config;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Image.asset(
                    config?.logo ?? '',
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    I18n.of(context)!.sign_in,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 24.0),
                  ),
                  SizedBox(height: 16),
                  _buildInput(
                    context,
                    I18n.of(context)!.id_number,
                    _usernameController,
                  ),
                  SizedBox(height: 12),
                  _buildInput(
                    context,
                    I18n.of(context)!.password,
                    _passwordController,
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(Routes.FORGOT_PASSWORD),
                      child: Text(
                        I18n.of(context)!.forget_password,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: const Color(0xff8c8c8c), fontSize: 13.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  CTALoadingButton(
                    label: I18n.of(context)!.sign_in,
                    mainColor: Theme.of(context).primaryColor,
                    onPressed: _signIn,
                    isCompleteAction: !_isLoading,
                  ),
                  SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        I18n.of(context)!.or,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              color: Color(0xff8C8C8C),
                            ),
                      ),
                      CTAButton(
                        label: I18n.of(context)!.create_account,
                        mainColor: Theme.of(context).backgroundColor,
                        secondaryColor:
                            Theme.of(context).primaryColor.withOpacity(0.5),
                        textStyle: Theme.of(context).textTheme.caption,
                        onPressed: () {
                          if (!_isLoading)
                            Navigator.of(context).pushNamed(Routes.SIGN_UP);
                        },
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                  CTAButton(
                    label: I18n.of(context)!.submit_question_or_request,
                    mainColor: Theme.of(context).secondaryHeaderColor,
                    onPressed: () {
                      if (!_isLoading)
                        Navigator.of(context).pushNamed(Routes.REQUEST_PAGE);
                    },
                  ),
                  SizedBox(height: 15),
                  CTAButton(
                    label: I18n.of(context)!.submit_suggestion_or_complaint,
                    mainColor: Theme.of(context).secondaryHeaderColor,
                    onPressed: () {
                      if (!_isLoading)
                        Navigator.of(context)
                            .pushNamed(Routes.SUGGESTION_COMPLAINT_PAGE);
                    },
                  ),
                  _getLanguageSelector(context),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getLanguageSelector(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            child: Text(
              I18n.of(context)!.language,
              style: Theme.of(context).textTheme.caption?.copyWith(
                    fontSize: 17,
                  ),
            ),
          ),
          DropdownButton<String>(
            value: MunicipalityApp.of(context)!.locale.languageCode,
            iconSize: 0,
            elevation: 16,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            underline: Container(
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
            onChanged: (String? newValue) {
              MunicipalityApp.of(context)!.setLocale(Locale(newValue ?? 'ar'));
            },
            items: <String>['en', 'ar']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void _signIn() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    UserCredentials credentials = UserCredentials(username, password);
    setState(() {
      _isLoading = true;
    });
    bool loginSucceeded = await context
        .read<UserChangeNotifier>()
        .userLogin(credentials: credentials);
    if (!loginSucceeded) {
      setState(() {
        _isLoading = false;
      });

      SnackbarUtil.showSnackbar(context,
          message: I18n.of(context)!.incorrect_credentials);
    }
  }

  Widget _buildInput(context, String hint, TextEditingController controller) {
    return CustomInputText(
      controller: controller,
      keyboardType: hint == I18n.of(context)!.password
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      obscureText: hint == I18n.of(context)!.password,
      hintText: hint,
    );
  }
}
