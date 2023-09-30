import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import 'font_manager.dart';

TextStyle getTextStyle(Color fontColor){
  return GoogleFonts.notoSansArabic(
      color: fontColor,
      fontWeight: FontWeight.w500,
      fontSize: 16
  );
}

TextStyle getMediumTextStyle(){
  return GoogleFonts.montserrat(
      color: dTextColor,
      fontWeight: FontWeight.w600,
      fontSize: FontSize.s18
  );
}

TextStyle getBoldTextStyle(){
  return GoogleFonts.notoSansArabic(
      color: dTextColor,
      fontWeight: FontWeight.w600,
      fontSize: FontSize.s18
  );
}

TextStyle getHintTextStyle(){
  return GoogleFonts.notoSansArabic(
      color: JTeal9C,
      fontWeight: FontWeight.w600,
      fontSize: FontSize.s16
  );
}

TextStyle getLabelTextStyle(){
  return GoogleFonts.notoSansArabic(
      color: JTeal74,
      fontWeight: FontWeight.w600,
      fontSize: FontSize.s16
  );
}