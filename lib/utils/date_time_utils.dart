import 'package:intl/intl.dart' show DateFormat;

class DateTimeFormatConstants {
  static const iso8601WithMillisecondsOnly = 'yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'';
  static const defaultDateTimeFormat = 'EEEE, d MMM y';
  static const dMMMyyyyHHmmFormatID = 'd MMM yyyy, HH.mm';
  static const dMMMyyyyHHmmFormatEN = 'd MMM yyyy, HH:mm';
  static const dMMMyyyyFormat = 'd MMM yyyy';
  static const ddMMMyyyyFormat = 'dd MMM yyyy';
  static const dMMMMyyyyFormat = 'd MMMM yyyy';
  static const ddMMyyyyFormat = 'ddMMyyyy';
  static const mMMyyyyFormat = 'MMM yyyy';
  static const ddMMMFormat = 'd MMM';
  static const timeHHmmssFormatID = 'HH.mm.ss';
  static const timeHHmmssFormatEN = 'HH:mm:ss';
  static const timeHHmmFormatID = 'HH.mm';
  static const timeHHmmFormatEN = 'HH:mm';
  static const eEEEdMMMMyFormat = 'EEEE, d MMMM y';
  static const yyyyMMdd = 'yyyy-MM-dd';
  static const ddMMyyyy = 'dd-MM-yyyy';
  static const day = 'dd';
  static const weekday = 'EEEE';
  static const month = 'MMM';
  static const ddMMMMyyyy = 'dd MMMM yyyy';
  static const ddMMMyyyy = 'dd MMM yyyy';
  static const timeMMMMyyyy = 'MMMM yyyy';
  static const mmyy = 'MM/yy';
  static const timeSeparater = ':';
  static const String monthFull = 'MMMM';
  static const String year = 'y';

  static const timeBooking = 'HH:mm';
  static const hHddMMyyyy = 'dd/MM/yyyy';
}

class DateTimeUtils {
  static String getDate(DateTime dateTime) {
    final dateFormat = DateFormat(DateTimeFormatConstants.ddMMyyyy);
    return dateFormat.format(dateTime);
  }

  static String format(int timestamp, String format) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final dateFormat = DateFormat(format);
    return dateFormat.format(date);
  }

  static String getDateFromTimeStamp(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final dateFormat = DateFormat(DateTimeFormatConstants.ddMMyyyy);
    return dateFormat.format(date);
  }

  static String getTimeAndDate(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final dateFormat = DateFormat(DateTimeFormatConstants.hHddMMyyyy);
    return '${date.hour}h ${dateFormat.format(date)}';
  }

  static String getTimeBooking(DateTime time) {
    final dateFormat = DateFormat(DateTimeFormatConstants.timeBooking, 'en');
    return dateFormat.format(time);
  }

  static DateTime parse(int timestamp) {
    try {
      return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    } catch (_) {
      return DateTime.now();
    }
  }
}
