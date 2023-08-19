import 'package:flutter/material.dart';

class DateTimeUtils {
  // time picker
  static Future<TimeOfDay?> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 8, minute: 0),
      cancelText: 'Batal',
      confirmText: 'Pilih',
      helpText: 'Pilih Jam',
      hourLabelText: 'Jam',
      minuteLabelText: 'Menit',
    );

    return picked;
  }

  // formatter from duration to string
  static String durationToString(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    if (hours == 0) return '$minutes menit';

    return '$hours jam $minutes menit';
  }

  // string to duration
  static Duration stringToDuration(String duration) {
    final parts = duration.split(' ');

    if (parts.length == 2) {
      final minutes = parts[0] == '0' ? 0 : int.parse(parts[0]);

      return Duration(minutes: minutes);
    }

    final hours = parts[0] == '0' ? 0 : int.parse(parts[0]);
    final minutes = parts[2] == '0' ? 0 : int.parse(parts[2]);

    return Duration(hours: hours, minutes: minutes);
  }

  // formatter from time of day to string
  static String timeOfDayToString(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hour.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }
}
