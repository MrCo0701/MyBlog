import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(String isoString) {
    final dateTime = DateTime.parse(isoString).toLocal();

    return DateFormat('dd MMM yyyy').format(dateTime);
  }
}
