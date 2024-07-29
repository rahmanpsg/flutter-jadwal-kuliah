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
    rebuildUi();
  }

  void setEndMonth(int month) {
    endMonth = month;
    rebuildUi();
  }
}
