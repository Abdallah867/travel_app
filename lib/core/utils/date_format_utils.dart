import 'package:intl/intl.dart';

class DateFormatUtils {
  static String getFormattedDateByDayAndMonth(String dateTime) {
    DateTime parsedDateTime = DateTime.parse(dateTime);
    String date = DateFormat('dd/MM').format(parsedDateTime);
    return date;
  }

  static String getFormattedDateByDayAndMonthAndYear(DateTime dateTime) {
    String date = DateFormat('dd/MM/yyyy').format(dateTime);
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

  static int calculateAge(DateTime birthDate) {
    // DateTime birthDate = DateFormat('MM/dd/yyyy').parse(birthday);
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  static String transformSlashesToTire(String date) {
    return date.split('/').reversed.join('-');
  }

  static String formatDateToIso8601(String date) {
    // Trim any leading or trailing whitespace from the input
    date = date.trim();

    // Check if the date has the correct format 'yyyy-MM-dd'
    if (RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(date)) {
      // Split the input date into year, month, day
      List<String> dateParts = date.split('-');

      // Parse the date parts into integers
      try {
        int year = int.parse(dateParts[0]);
        int month = int.parse(dateParts[1]);
        int day = int.parse(dateParts[2]);

        // Create a DateTime object using the parsed values
        DateTime formattedDate = DateTime(year, month, day);

        // Return the ISO 8601 formatted string with midnight time
        return '${formattedDate.year}-${formattedDate.month.toString().padLeft(2, '0')}-${formattedDate.day.toString().padLeft(2, '0')}T00:00:00.000Z';
      } catch (e) {
        // Handle the error gracefully if parsing fails
        print('Error parsing date: $e');
        return '';
      }
    } else {
      // If input doesn't match the expected format, return an error message
      print('Invalid date format');
      return '';
    }
  }

  static bool isDateBetween(
      String startDate, String endDate, String? tripDate) {
    if (tripDate == null) {
      return false;
    }
    // Define the date format
    var dateFormat = 'dd/MM/yyyy';

    // Parse the date strings into DateTime objects
    DateTime start = DateTime.parse(startDate.split('/').reversed.join('-'));
    DateTime end = DateTime.parse(endDate.split('/').reversed.join('-'));
    DateTime trip = DateTime.parse(tripDate.split('/').reversed.join('-'));

    // Check if the user's date is between start and end date (inclusive)
    return trip.isAfter(start) && trip.isBefore(end) ||
        trip.isAtSameMomentAs(start) ||
        trip.isAtSameMomentAs(end);
  }
}
