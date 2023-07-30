import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/ui_helpers.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:stacked/stacked.dart';
import 'package:unicons/unicons.dart';

import 'program_studi_viewmodel.dart';

class ProgramStudiView extends StackedView<ProgramStudiViewModel> {
  const ProgramStudiView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProgramStudiViewModel viewModel,
    Widget? child,
  ) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Table ${viewModel.table}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: viewModel.onAdd,
              icon: const Icon(UniconsLine.plus),
              label: Text('Tambah ${viewModel.table}'),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Column(
                children: [
                  ResponsiveDatatable(
                    headerDecoration: const BoxDecoration(
                      color: kcSecondaryColor,
                    ),
                    headerTextStyle:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: kcWhite,
                            ),
                    headers: viewModel.columns
                        .map(
                          (column) => DatatableHeader(
                            text: column,
                            value: column,
                          ),
                        )
                        .toList(),
                    source: [],
                  ),
                  // if empty
                  SizedBox(
                      height: screenHeightFraction(
                    context,
                    dividedBy: 2,
                    offsetBy: 200,
                  )),
                  const Align(
                    alignment: Alignment.center,
                    child: Text('Tidak ada data'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProgramStudiViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProgramStudiViewModel();

  @override
  void onViewModelReady(
    ProgramStudiViewModel viewModel,
  ) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
