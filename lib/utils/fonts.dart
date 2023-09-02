import 'package:flutter/material.dart';

import 'colors.dart';

TextTheme buildTextTheme(
  TextTheme base,
  String? language, [
  String fontFamily = 'Cairo',
  String fontHeader = 'Cairo',
]) {
  const fontFamily = 'Cairo';
  return base
      .copyWith(
        headline1: base.headline1!.copyWith(
            fontWeight: FontWeight.w700, fontFamily: fontFamily

            /// If using the custom font, un-comment below and clone to other headline.., bodyText..
            /// fontFamily: 'Your-Custom-Font',
            ),
        headline2: base.headline2!
            .copyWith(fontWeight: FontWeight.w700, fontFamily: fontFamily),
        headline3: base.headline3!
            .copyWith(fontWeight: FontWeight.w700, fontFamily: fontFamily),
        headline4: base.headline4!
            .copyWith(fontWeight: FontWeight.w700, fontFamily: fontFamily),
        headline5: base.headline5!
            .copyWith(fontWeight: FontWeight.w500, fontFamily: fontFamily),
        headline6: base.headline6?.copyWith(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            fontFamily: fontFamily),
        subtitle1: base.subtitle1?.copyWith(fontFamily: fontFamily),
        subtitle2: base.subtitle2?.copyWith(fontFamily: fontFamily),
        bodyText1: base.bodyText1?.copyWith(fontFamily: fontFamily),
        bodyText2: base.bodyText1?.copyWith(fontFamily: fontFamily),
        button: base.button!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            fontFamily: fontFamily),
        caption: base.caption?.copyWith(
            color: Color(0xff666666),
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            fontFamily: fontFamily),
      )
      .apply(
        displayColor: kGrey900,
        bodyColor: kGrey900,
      );
}
