import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/ui_helpers.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:stacked/stacked.dart';
import 'package:unicons/unicons.dart';

import 'matakuliah_viewmodel.dart';

class MatakuliahView extends StackedView<MatakuliahViewModel> {
  const MatakuliahView({super.key});

  @override
  Widget builder(
    BuildContext context,
    MatakuliahViewModel viewModel,
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
                    // autoHeight: false,
                    // isLoading: true,
                    headerDecoration: const BoxDecoration(
                      color: kcSecondaryColor,
                    ),
                    // dropContainer: (value) {
                    //   return Container(
                    //     color: kcSecondaryColor,
                    //     child: Text(value.toString()),
                    //   );
                    // },
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
                    // footers: [
                    //   Container(
                    //     padding: const EdgeInsets.symmetric(horizontal: 15),
                    //     child: Text(
                    //       "Rows per page: ",
                    //       style: Theme.of(context).textTheme.bodyMedium,
                    //     ),
                    //   )
                    // ],
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
  MatakuliahViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MatakuliahViewModel();

  @override
  void onViewModelReady(
    MatakuliahViewModel viewModel,
  ) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
