import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MonthRangePickerSheetModel extends BaseViewModel {
  final List<String> months = [
    'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
    'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
  ];

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 30));

  void setStartDate(DateTime date) {
    startDate = date;
    if (endDate.isBefore(startDate)) {
      endDate = startDate;
    }
    notifyListeners();
  }

  void setEndDate(DateTime date) {
    endDate = date;
    if (startDate.isAfter(endDate)) {
      startDate = endDate;
    }
    notifyListeners();
  }


  DateTime getFirstDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  DateTime getLastDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0);
  }
}
