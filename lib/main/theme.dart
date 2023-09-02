import 'package:flutter/material.dart';
import 'package:municipality_app/environments/config/config.dart';
import 'package:municipality_app/utils/colors.dart';
import 'package:municipality_app/utils/municipality_theme.dart';

ThemeData getTheme(context, code) {
  Config? config = FlavorConfig.instance?.config;
  Color backgroundColor = HexColor(config?.backgroundColor ?? dBackgroundColor);

  Color primaryColor = HexColor(
    config?.primaryColor ?? dPrimaryColor,
  );

  Color textColor = HexColor(
    config?.textColor ?? dTextColor,
  );

  Color secondaryColor = HexColor(
    config?.secondaryColor ?? dSecondaryColor,
  );

  ThemeData themeData;
  themeData = buildMunicipalityTheme(code);
  themeData = themeData.copyWith(
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor,
    backgroundColor: backgroundColor,
    primaryColorLight: primaryColor,
    textTheme: themeData.textTheme.apply(
      displayColor: textColor,
      bodyColor: textColor,
    ),
    colorScheme: themeData.colorScheme.copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
  );
  return themeData;
}
