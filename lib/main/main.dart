import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:municipality_app/change_notifiers/user_change_notifier.dart';
import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/constants/shared_preferences_constants.dart';
import 'package:municipality_app/main/app_router.dart';
import 'package:municipality_app/main/providers_setup.dart';
import 'package:municipality_app/main/theme.dart';

import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/utils/shared_preferences_util.dart';

import 'package:provider/provider.dart';

class MunicipalityAppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providers, child: MunicipalityApp());
  }
}

class MunicipalityApp extends StatefulWidget {
  @override
  State<MunicipalityApp> createState() => _MunicipalityAppState();
  static _MunicipalityAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MunicipalityAppState>();
}

class _MunicipalityAppState extends State<MunicipalityApp> {
  bool _loading = true;
  late Locale locale;
  final GeneratedLocalizationsDelegate i18n = I18n.delegate;

  void setLocale(Locale value) async {
    await SharedPreferencesUtil.setString(
        SharedPreferencesConstants.LOCALE, value.languageCode);
    setState(() {
      locale = value;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      locale = Locale(await SharedPreferencesUtil.getString(
              SharedPreferencesConstants.LOCALE) ??
          'en');

      try {
        await context.read<UserChangeNotifier>().autoSignin();
      } catch (exp) {}
      setState(() {
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : MaterialApp(
            theme: getTheme(context, locale.languageCode),
            locale: locale,
            debugShowCheckedModeBanner: false,
            title: 'Municipality App ${locale.languageCode}',
            supportedLocales: i18n.supportedLocales,
            initialRoute: Routes.ROOT,
            localizationsDelegates: [
              I18n.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback:
                i18n.resolution(fallback: Locale("en", "")),
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
  }
}
