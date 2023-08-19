import 'package:equatable/equatable.dart';

class ItemModel<T> extends Equatable {
  final String label;
  final T value;
  final bool isSelected;

  const ItemModel({
    required this.label,
    required this.value,
    this.isSelected = false,
  });

  @override
  List<Object?> get props => [label, value];
}
