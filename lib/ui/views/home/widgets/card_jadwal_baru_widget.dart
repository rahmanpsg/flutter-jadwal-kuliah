import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/enums/semester_type.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CardJadwalBaruWidget extends ViewModelWidget<HomeViewModel> {
  const CardJadwalBaruWidget({super.key});

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderSide: const BorderSide(
          color: kcBlack,
        ),
        borderRadius: BorderRadius.circular(12),
      );

  InputDecoration get inputDecoration => InputDecoration(
        fillColor: kcBackgroundColor,
        filled: true,
        enabledBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder.copyWith(
          borderSide: const BorderSide(
            color: kcPrimaryColor,
            width: 1.5,
          ),
        ),
        errorBorder: outlineInputBorder.copyWith(
          borderSide: const BorderSide(
            color: kcDangerColor,
          ),
        ),
        focusedErrorBorder: outlineInputBorder.copyWith(
          borderSide: const BorderSide(
            color: kcDangerColor,
            width: 1.5,
          ),
        ),
      );

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownSearch<SemesterType>(
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: inputDecoration.copyWith(
                hintText: '- Pilih Semester -',
              ),
            ),
            items: SemesterType.values,
            itemAsString: (item) => item.name.toUpperCase(),
            onChanged: (v) => viewModel.semester = v,
          ),
          const SizedBox(height: 16),
          DropdownSearch<String>(
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: inputDecoration.copyWith(
                hintText: '- Pilih Tahun Akademik -',
              ),
            ),
            asyncItems: (_) => viewModel.getTahunAkademik(),
            onChanged: (v) => viewModel.tahunAkademik = v,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: kcPrimaryColor.withOpacity(.3),
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: viewModel.isButtonGenerateEnabled &&
                    !viewModel.busy('onGenerate')
                ? viewModel.onGenerate
                : null,
            icon: viewModel.busy('onGenerate')
                ? const SizedBox.square(
                    dimension: 25,
                    child: CircularProgressIndicator(),
                  )
                : const Icon(Icons.switch_access_shortcut_add_rounded),
            label: const Text('Generate Jadwal Baru'),
          ),
        ],
      ),
    );
  }
}
