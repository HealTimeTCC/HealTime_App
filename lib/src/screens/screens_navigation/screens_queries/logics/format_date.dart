import 'package:flutter/material.dart';
import 'package:healtime/shared/utility/extesion_datetime.dart';
import 'package:intl/intl.dart';

class FormatDate{
  static String formaDate({required DateTime date, required TimeOfDay time}) {

    String dateFormat = DateFormat('yyyy-MM-dd HH:mm')
        .format(DateTime(date.year, date.month, date.day, time.hour, time.minute)).toString();

    return DateTime.parse(dateFormat).toIso8601String().substring(0, 19);
  }
}