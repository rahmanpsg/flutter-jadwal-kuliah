import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  static TimeOfDay fromJson(String json) {
    final parts = json.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  static String toJson(TimeOfDay timeOfDay) {
    return '${timeOfDay.hour}:${timeOfDay.minute}';
  }

  static TimeOfDay fromString(String time) {
    final parts = time.split(':');

    // only get number
    parts[0] = parts[0].replaceAll(RegExp(r'[^0-9]'), '');
    parts[1] = parts[1].replaceAll(RegExp(r'[^0-9]'), '');

    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  bool isBefore(TimeOfDay timeOfDay) {
    if (hour < timeOfDay.hour) return true;
    if (hour == timeOfDay.hour && minute < timeOfDay.minute) return true;

    return false;
  }

  // add duration to time of day
  TimeOfDay add(Duration duration) {
    final minutes = hour * 60 + minute + duration.inMinutes;

    return TimeOfDay(
      hour: minutes ~/ 60,
      minute: minutes % 60,
    );
  }
}
