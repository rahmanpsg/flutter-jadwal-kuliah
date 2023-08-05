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

  static int toInt(KelasType value) => value.value;

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
