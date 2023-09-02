import 'package:flutter/material.dart';
import 'package:municipality_app/change_notifiers/user_change_notifier.dart';
import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/environments/config/config.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/main/main.dart';
import 'package:municipality_app/pages/content_page.dart';
import 'package:provider/provider.dart';

class MenuDrawerWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  MenuDrawerWidget({required this.scaffoldKey});
  final ScrollController _controller = ScrollController();

  Widget _getSubTitle(BuildContext context,
      {required IconData icon, required String text}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            child: Text(
              text,
              style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22.0,
                  ),
            ),
          )
        ],
      ),
    );
  }

  void pushContentPage(
    context, {
    required String text,
    required String iconUrl,
    required String appbarTitle,
  }) {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContentPage(
          text: text,
          iconUrl: iconUrl,
          appbarTitle: appbarTitle,
        ),
      ),
    );
  }

  Widget _getTitle(context) {
    return Text(
      I18n.of(context)!.menu,
      style: Theme.of(context).textTheme.caption?.copyWith(
            fontSize: 34.0,
            fontWeight: FontWeight.w700,
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

  Widget _getSettingsItem(
    context, {
    required String text,
    required VoidCallback onClick,
  }) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: 17,
                      ),
                ),
              ),
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }

  void _gotToRoute(context, route) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: Theme.of(context).backgroundColor,
      width: MediaQuery.of(context).size.width * 0.8,
      height: height,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            children: [
              _getTitle(context),
              _getSubTitle(
                context,
                icon: Icons.menu,
                text: I18n.of(context)!.my_requests,
              ),
              _getSettingsItem(
                context,
                text: I18n.of(context)!.old_services_requests,
                onClick: () => _gotToRoute(context, Routes.REQUESTS),
              ),
              _getSettingsItem(
                context,
                text: I18n.of(context)!.request_new_service,
                onClick: () => _gotToRoute(context, Routes.SERVICES_LIST),
              ),
              _getSubTitle(
                context,
                icon: Icons.person_outline,
                text: I18n.of(context)!.my_account,
              ),
              _getSettingsItem(
                context,
                text: I18n.of(context)!.my_bills,
                onClick: () => _gotToRoute(context, Routes.MY_BILLS),
              ),
              _getSettingsItem(
                context,
                text: I18n.of(context)!.taxes,
                onClick: () => _gotToRoute(context, Routes.MY_TAXES),
              ),
              _getSettingsItem(
                context,
                text: I18n.of(context)!.my_files,
                onClick: () => _gotToRoute(context, Routes.MY_FILES),
              ),
              _getSettingsItem(
                context,
                text: I18n.of(context)!.my_information,
                onClick: () => _gotToRoute(context, Routes.MY_PROFILE),
              ),
              // _getSettingsItem(
              //   context,
              //   text: I18n.of(context)!.payments_methods,
              //   onClick: () =>
              //       Navigator.of(context).pushNamed(Routes.PAYMENT_METHODS),
              // ),
              _getSubTitle(
                context,
                icon: Icons.settings,
                text: I18n.of(context)!.settings,
              ),
              _getSettingsItem(
                context,
                text: I18n.of(context)!.support,
                onClick: () => _gotToRoute(context, Routes.TECHNICAL_SUPPORT),
              ),
              _getSettingsItem(context,
                  text: I18n.of(context)!.privacy_policy,
                  onClick: () => pushContentPage(
                        context,
                        appbarTitle: I18n.of(context)!.privacy_policy,
                        iconUrl: 'assets/icons/privacy_policy.svg',
                        text: FlavorConfig.instance!.config.getPrivacyPolicy(
                            MunicipalityApp.of(context)!.locale.languageCode),
                      )),
              _getSettingsItem(
                context,
                text: I18n.of(context)!.terms_conditions,
                onClick: () => pushContentPage(
                  context,
                  appbarTitle: I18n.of(context)!.terms_conditions,
                  iconUrl: 'assets/icons/terms_and_conditions.svg',
                  text: FlavorConfig.instance!.config.getTermsAndConditions(
                      MunicipalityApp.of(context)!.locale.languageCode),
                ),
              ),
              _getSettingsItem(
                context,
                text: I18n.of(context)!.suggestion_or_complaint,
                onClick: () => _gotToRoute(
                  context,
                  Routes.SUGGESTION_COMPLAINT_PAGE,
                ),
              ),
              _getSettingsItem(
                context,
                text: I18n.of(context)!.faq,
                onClick: () => _gotToRoute(context, Routes.FAQ),
              ),
              _getLanguageSelector(context),
              _getSettingsItem(
                context,
                text: I18n.of(context)!.logout,
                onClick: () => context.read<UserChangeNotifier>().logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
