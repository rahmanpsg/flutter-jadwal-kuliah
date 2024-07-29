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

  void init(int startMonth, int endMonth) {
    this.startMonth = startMonth;
    this.endMonth = endMonth;

    rebuildUi();
  }

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
