// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

class DataTimeMask {
  static String formatted(String dateTime) {
    final date = DateTime.parse(dateTime);
    return DateFormat("dd/MM/yyyy, 'às' HH:mm'h'").format(date);
  }
}
