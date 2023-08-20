enum SemesterType {
  genap(0),
  ganjil(1);

  final int value;

  const SemesterType(this.value);

  List<String> gets() {
    final list = <int>[];

    var semester = value;

    while (semester <= 8) {
      list.add(semester);
      semester += 2;
    }

    return list.map((e) => e.toString()).toList();
  }
}
