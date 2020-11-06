import 'package:intl/intl.dart';

String mysqlDateTimeFormat = 'yyyy-MM-dd HH:mm:ss';

String toMysqlDateTime(DateTime datetime) {
  DateFormat formatter = DateFormat(mysqlDateTimeFormat);
  return formatter.format(datetime);
}

DateTime fromMysqlDateTime(String datetime) {
  DateFormat formatter = DateFormat(mysqlDateTimeFormat);
  return formatter.parse(datetime);
}

String toHumanReadableDate(DateTime datetime, [String format = 'dd MMM yyyy']) {
  final formatter = DateFormat(format);
  return formatter.format(datetime);
}

int toPregnantAge(String pregnantAgeUpdatedAt, int pregnantAgeWeek) {
  final regisertedDateTime = fromMysqlDateTime(pregnantAgeUpdatedAt);
  final now = DateTime.now();

  final diffInWeeks =
      (regisertedDateTime.difference(now).inDays / 7).abs().toInt();

  return pregnantAgeWeek + diffInWeeks;
}

bool isSameDate(DateTime datetime, DateTime other) {
  return datetime.day == other.day &&
      datetime.month == other.month &&
      datetime.year == other.year;
}
