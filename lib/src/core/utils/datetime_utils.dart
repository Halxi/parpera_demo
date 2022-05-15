class DateTimeUtils {
  static DateTime getDateTimeBasedOnString(String dateTimeText) {
    DateTime finalDateTime = DateTime.parse(dateTimeText);
    return finalDateTime.toUtc();
  }
}