import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:unicons/unicons.dart';

class CustomActionsTableButton extends StatelessWidget {
  final Function() onEdit;
  final Function() onDelete;

  const CustomActionsTableButton({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onEdit,
          icon: const Icon(
            UniconsLine.edit,
            color: kcTertiaryColor,
          ),
        ),
        IconButton(
          onPressed: onDelete,
          icon: const Icon(
            UniconsLine.trash,
            color: kcDangerColor,
          ),
        ),
      ],
    );
  }
}
