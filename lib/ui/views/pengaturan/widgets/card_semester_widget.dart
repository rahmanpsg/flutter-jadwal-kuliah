import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/enums/periode_semester_type.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/ui_helpers.dart';
import 'package:jadwal_kuliah/ui/views/pengaturan/pengaturan_viewmodel.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:unicons/unicons.dart';

class CardSemesterWidget extends ViewModelWidget<PengaturanViewModel> {
  const CardSemesterWidget({super.key});

  @override
  Widget build(BuildContext context, PengaturanViewModel viewModel) {
    return SizedBox(
      width: getValueForScreenType<double>(
        context: context,
        mobile: double.infinity,
        desktop: screenWidthFraction(
              context,
            ) *
            .87,
      ),
      child: Card(
        child: Column(
          children: [
            const ListTile(
              tileColor: kcSecondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
              textColor: kcWhite,
              leading: Icon(
                UniconsLine.calendar_alt,
                color: kcWhite,
              ),
              title: Text('Semester'),
            ),
            if (viewModel.busy('hari')) const LinearProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Semester Ganjil',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Semester Genap',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          viewModel.ganjil != null
                              ? '${viewModel.ganjil!.startMonthText} - ${viewModel.ganjil!.endMonthText}'
                              : 'Belum diatur',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () => viewModel
                            .onSelectSemester(PeriodeSemesterType.ganjil),
                        icon: const Icon(
                          UniconsLine.edit,
                          color: kcTertiaryColor,
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        child: Text(
                          viewModel.genap != null
                              ? '${viewModel.genap!.startMonthText} - ${viewModel.genap!.endMonthText}'
                              : 'Belum diatur',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () => viewModel
                            .onSelectSemester(PeriodeSemesterType.genap),
                        icon: const Icon(
                          UniconsLine.edit,
                          color: kcTertiaryColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
