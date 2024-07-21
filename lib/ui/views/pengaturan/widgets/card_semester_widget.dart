import 'package:flutter/material.dart';
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
            ListTile(
              tileColor: kcSecondaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
              textColor: kcWhite,
              leading: const Icon(
                UniconsLine.calendar_alt,
                color: kcWhite,
              ),
              title: const Text('Semester'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  UniconsLine.edit,
                  color: kcWhite,
                ),
              ),
            ),
            if (viewModel.busy('hari')) const LinearProgressIndicator(),
            // add form editable for semester ganjil and genap with month - month

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
                      Expanded(
                        child: Text(
                          'Agustus - Januari',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Februari - Juli',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
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
