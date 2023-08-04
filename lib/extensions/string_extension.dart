extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String capitalizeEach() {
    return split(' ').map((str) => str.capitalize()).join(' ');
  }

  String toSnakeCase() {
    return split(' ').map((str) => str.toLowerCase()).join('_');
  }

  String? toNull() {
    if (isEmpty) return null;
    return this;
  }
}
