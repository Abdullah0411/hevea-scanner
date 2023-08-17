import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static DateTime get now => DateTime.now();

  static String get nowString => now.toString();

  static get currentDateWithDay => DateFormat('EEEE, d MMM').format(now);

  static get nowFormatted => slashFormatted(now);

  static String slashFormatted(DateTime date) =>
      DateFormat('y/M/d').format(date);

  // function to get how many days left until the next month
  static int get daysLeftUntilNextMonth {
    final now = DateTime.now();
    final nextMonth = DateTime(now.year, now.month + 1, 1);
    final difference = nextMonth.difference(now);
    return difference.inDays;
  }

  static Map<String, String> localMap = {"ar": "ar_sa", "en": "en_us"};

  /// Get the hours from timestamp in the format i.e 3PM
  static String get12HoursAsString(Timestamp? timestamp, String localCode) {
    if (timestamp == null) return '';

    // Formate the timestamp based on the local code passed
    return DateFormat('j', localMap[localCode]).format(timestamp.toDate());
  }

  static String getFullDate(Timestamp? timestamp, String localCode) {
    if (timestamp == null) return '';
    return DateFormat('yMd', localMap[localCode]).format(timestamp.toDate());
  }

  static String getMonthAndDayString(DateTime dateTime, String localCode) {
    return DateFormat('MMMMd', localMap[localCode]).format(dateTime);
  }

  static String getMonthAndDayAndYearString(
      DateTime dateTime, String localCode) {
    return DateFormat('yMMMMd', localMap[localCode]).format(dateTime);
  }

  static String getYearAndMonthAndDayAndTimeString(
      DateTime dateTime, String localCode) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss.S", localMap[localCode])
        .format(dateTime);
  }

  static String getAbbrMonthAndDayAndYearString(
      DateTime dateTime, String localCode) {
    return DateFormat('yMMMd', localMap[localCode]).format(dateTime);
  }

  static DateTime fromIntToDateTime(dynamic timestamp) {
    if (timestamp is double) {
      timestamp = (timestamp).toInt();
    }

    if (timestamp == null) {
      return now;
    }
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  static String timestampIntoFormattedDate(dynamic timestamp) {
    if (timestamp is double) {
      timestamp = (timestamp).toInt();
    }

    if (timestamp == null) {
      return '-';
    }

    return DateFormat("d MMM، y,")
        .add_jm()
        .format(fromIntToDateTime(timestamp));
  }

  static String? timestampIntoFormattedDateWithoutTime(dynamic timestamp) {
    if (timestamp is double) {
      timestamp = (timestamp).toInt();
    }

    if (timestamp == null) {
      return '-';
    }

    return formateDateWithoutTime(fromIntToDateTime(timestamp));
  }

  static String? formateDateWithoutTime(DateTime? date) {
    if (date == null) return null;
    return DateFormat("d MMM، y").format(date);
  }

  static String formateDateYearAndMonth(DateTime? date) {
    if (date == null) return '';
    return DateFormat("y، MMM").format(date);
  }

  static String formateDateDayAndMonth(DateTime? date) {
    if (date == null) return '';

    return DateFormat("MMM، d").format(date);
  }

  static String formateDateOnlyMonthAndYearWithDash(DateTime date) {
    return DateFormat("MM-yyyy").format(date);
  }
}

extension DateTimeExtensionOnDouble on double? {
  DateTime? toDate() {
    if (this == null) {
      return null;
    }
    return DateUtil.fromIntToDateTime(this);
  }
}

extension DateTimeExtensionOnInt on int? {
  DateTime? toDate() {
    if (this == null) {
      return null;
    }
    try {
      return DateUtil.fromIntToDateTime(this);
    } catch (e) {
      return null;
    }
  }
}

extension DateTimeToTimestamp on DateTime? {
  int? toTimestamp() {
    if (this == null) {
      return null;
    }
    try {
      return this!.millisecondsSinceEpoch ~/ 1000;
    } catch (e) {
      return null;
    }
  }
}
