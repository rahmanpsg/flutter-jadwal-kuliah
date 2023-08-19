enum KelasType {
  reguler(0),
  nonReguler(1);

  final int value;

  const KelasType(this.value);

  factory KelasType.fromInt(int value) {
    switch (value) {
      case 0:
        return KelasType.reguler;
      case 1:
        return KelasType.nonReguler;
      default:
        return KelasType.reguler;
    }
  }

  static fromListInt(List<dynamic> list) {
    final kelas = <KelasType>[];

    for (final item in list) {
      kelas.add(KelasType.fromInt(item));
    }

    return kelas;
  }

  static int toInt(KelasType value) => value.value;

  static List<int> toListInt(List<KelasType> list) {
    final kelas = <int>[];

    for (final item in list) {
      kelas.add(item.value);
    }

    return kelas;
  }

  @override
  String toString() {
    switch (this) {
      case KelasType.reguler:
        return 'Reguler';
      case KelasType.nonReguler:
        return 'Non Reguler';
      default:
        return '';
    }
  }
}
