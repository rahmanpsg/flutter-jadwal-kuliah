import 'package:equatable/equatable.dart';

class ItemModel<T> extends Equatable {
  final String label;
  final T value;

  const ItemModel({
    required this.label,
    required this.value,
  });

  @override
  List<Object?> get props => [label, value];
}
