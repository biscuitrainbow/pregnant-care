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

bool isSameDate(DateTime datetime, DateTime other) {
  return datetime.day == other.day && datetime.month == other.month && datetime.year == other.year;
}
