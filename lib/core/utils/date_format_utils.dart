import 'package:intl/intl.dart';

class DateFormatUtils {
  static String getFormattedDateByDayAndMonth(String dateTime) {
    DateTime parsedDateTime = DateTime.parse(dateTime);
    String date = DateFormat('dd/MM').format(parsedDateTime);
    return date;
  }

  static String getFormattedDateByDayAndMonthAndYear(String dateTime) {
    DateTime parsedDateTime = DateTime.parse(dateTime);
    String date = DateFormat('dd/MM/yyyy').format(parsedDateTime);
    return date;
  }

  static String getWeekday(String dateTime) {
    DateTime parsedDateTime = DateTime.parse(dateTime);
    int weekdayIndex = parsedDateTime.weekday;
    switch (weekdayIndex) {
      case DateTime.monday:
        return "Monday";
      case DateTime.tuesday:
        return "Tuesday";
      case DateTime.wednesday:
        return "Wednesday";
      case DateTime.thursday:
        return "Thursday";
      case DateTime.friday:
        return "Friday";
      case DateTime.saturday:
        return "Saturday";
      case DateTime.sunday:
        return "Sunday";
      default:
        return "Unknown";
    }
  }
}
