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
