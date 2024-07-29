import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MonthRangePickerSheetModel extends BaseViewModel {
  DateTime? startDate;
  DateTime? endDate;

  void setDateRange(DateTime? start, DateTime? end) {
    startDate = start;
    endDate = end;
    notifyListeners();
  }

  String getFormattedDateRange() {
    if (startDate == null || endDate == null) {
      return 'Select a date range';
    }
    return '${_formatDate(startDate!)} - ${_formatDate(endDate!)}';
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}';
  }
}
