import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MonthRangePickerSheetModel extends BaseViewModel {
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

  String getFormattedDateRange() {
    return '${_formatDate(startDate)} - ${_formatDate(endDate)}';
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}';
  }

  DateTime _getFirstDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  DateTime _getLastDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0);
  }
}
