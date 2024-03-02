import 'dart:convert';
import 'dart:math';
import 'dart:math' show cos, sqrt, asin;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';

class Tools {
  static double? formatDouble(num? value) => value == null ? null : value * 1.0;

  // /// check tablet screen
  // static bool isTablet(MediaQueryData query) {
  //   if (Config().isBuilder) {
  //     return false;
  //   }
  //
  //   if (kIsWeb) {
  //     return true;
  //   }
  //
  //   if (UniversalPlatform.isWindows || UniversalPlatform.isMacOS) {
  //     return false;
  //   }
  //
  //   var size = query.size;
  //   var diagonal =
  //       sqrt((size.width * size.width) + (size.height * size.height));
  //   var isTablet = diagonal > 1100.0;
  //   return isTablet;
  // }

  static Future<List<dynamic>> loadStatesByCountry(String country) async {
    try {
      // load local config
      var path = 'lib/config/states/state_${country.toLowerCase()}.json';
      final appJson = await rootBundle.loadString(path);
      return List<dynamic>.from(jsonDecode(appJson));
    } catch (e) {
      return [];
    }
  }

  static dynamic getValueByKey(Map<String, dynamic>? json, String? key) {
    if (key == null) return null;
    try {
      List keys = key.split('.');
      Map<String, dynamic>? data = Map<String, dynamic>.from(json!);
      if (keys[0] == '_links') {
        var links = json['listing_data']['_links'] ?? [];
        for (var item in links) {
          if (item['network'] == keys[keys.length - 1]) return item['url'];
        }
      }
      for (var i = 0; i < keys.length - 1; i++) {
        if (data![keys[i]] is Map) {
          data = data[keys[i]];
        } else {
          return null;
        }
      }
      if (data![keys[keys.length - 1]].toString().isEmpty) return null;
      return data[keys[keys.length - 1]];
    } catch (e) {
      // printLog(e.toString());
      return 'Error when mapping $key';
    }
  }

  // ignore: always_declare_return_types
  static showSnackBar(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(message);
  }

  static Future<dynamic> parseJsonFromAssets(String assetsPath) async {
    return rootBundle.loadString(assetsPath).then(jsonDecode);
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static bool isRTL(BuildContext context) {
    return intl.Bidi.isRtlLanguage(
        Localizations.localeOf(context).languageCode);
  }

  static String? convertDateTime(DateTime date) {
    return DateFormat.yMd().add_jm().format(date);
  }

  static String getFileNameFromUrl(String url) {
    final urlRegExp = RegExp(
        r'(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})');
    final nameFromUrlRegExp = RegExp(r'(?:[^/][\d\w\.-]+)$(?<=\.\w{3,4})');
    if (urlRegExp.hasMatch(url) && nameFromUrlRegExp.hasMatch(url)) {
      return nameFromUrlRegExp.stringMatch(url)!;
    }
    return url;
  }

  // static String removeHTMLTags(String value) {
  //   try {
  //     final document = parse(value);
  //     if (document.body == null) {
  //       return value;
  //     }
  //     final parsedString = parse(document.body!.text).documentElement!.text;
  //     return parsedString;
  //   } catch (e) {
  //     printLog(e);
  //   }
  //   return value;
  // }

  static double calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    var distance = 12742 * asin(sqrt(a));
    return distance.roundToDouble();
  }

  static dynamic formatDate(String date) {
    var dateFormat = DateFormat(DateFormat.YEAR_MONTH_DAY);
    return dateFormat.format(DateTime.tryParse(date) ?? DateTime.now());
  }
}
