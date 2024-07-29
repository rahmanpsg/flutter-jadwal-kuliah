enum PeriodeSemesterType {
  ganjil,
  genap,
}

extension PeriodeSemesterTypeExtension on PeriodeSemesterType {
  String get name {
    switch (this) {
      case PeriodeSemesterType.ganjil:
        return 'Ganjil';
      case PeriodeSemesterType.genap:
        return 'Genap';
    }
  }

  static PeriodeSemesterType fromString(String value) {
    return PeriodeSemesterType.values.firstWhere(
      (element) => element.toString().split('.').last == value,
      orElse: () => throw ArgumentError('Invalid PeriodeSemesterType: $value'),
    );
  }
}
