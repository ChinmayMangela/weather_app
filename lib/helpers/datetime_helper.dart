import 'package:intl/intl.dart';

class DateTimeHelper {
  static String getCurrentFormattedTime() {
    DateTime now = DateTime.now();
    final timeFormatter = DateFormat('jm');
    return timeFormatter.format(now);
  }

  static String getCurrentDayAndDate() {
    DateTime now = DateTime.now();
    return DateFormat('EEEE    d/M/y').format(now);
  }
}