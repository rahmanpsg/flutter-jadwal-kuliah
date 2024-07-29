import 'package:jadwal_kuliah/enums/periode_semester_type.dart';

class PeriodeSemesterModel {
  final PeriodeSemesterType type;
  final int startMonth;
  final int endMonth;

  PeriodeSemesterModel({
    required this.type,
    required this.startMonth,
    required this.endMonth,
  });

  String get startMonthText => _getMonthName(startMonth);
  String get endMonthText => _getMonthName(endMonth);

  String _getMonthName(int month) {
    switch (month) {
      case 1: return 'Januari';
      case 2: return 'Februari';
      case 3: return 'Maret';
      case 4: return 'April';
      case 5: return 'Mei';
      case 6: return 'Juni';
      case 7: return 'Juli';
      case 8: return 'Agustus';
      case 9: return 'September';
      case 10: return 'Oktober';
      case 11: return 'November';
      case 12: return 'Desember';
      default: return 'Invalid Month';
    }
  }

  factory PeriodeSemesterModel.fromJson(Map<String, dynamic> json) {
    return PeriodeSemesterModel(
      type: PeriodeSemesterTypeExtension.fromString(json['type']),
      startMonth: json['start_month'],
      endMonth: json['end_month'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toString().split('.').last,
      'start_month': startMonth,
      'end_month': endMonth,
    };
  }
}
