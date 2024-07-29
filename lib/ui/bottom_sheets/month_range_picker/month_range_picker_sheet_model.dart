import 'package:stacked/stacked.dart';

class MonthRangePickerSheetModel extends BaseViewModel {
  final List<String> months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  int startMonth = DateTime.now().month;
  int endMonth = DateTime.now().month;

  void setStartMonth(int month) {
    startMonth = month;
    if (endMonth < startMonth) {
      endMonth = startMonth;
    }
    notifyListeners();
  }

  void setEndMonth(int month) {
    endMonth = month;
    if (startMonth > endMonth) {
      startMonth = endMonth;
    }
    notifyListeners();
  }
}
