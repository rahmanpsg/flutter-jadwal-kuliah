import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/extensions/string_extension.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/ui_helpers.dart';
import 'package:jadwal_kuliah/ui/widgets/custom_actions_table_button.dart';
import 'package:jadwal_kuliah/ui/widgets/custom_search_text_field.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
            Wrap(
              spacing: 16,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              children: [
                ElevatedButton.icon(
                  onPressed: viewModel.onAdd,
                  icon: const Icon(UniconsLine.plus),
                  label: Text('Tambah ${viewModel.table}'),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: getValueForScreenType<double>(
                      context: context,
                      mobile: 800,
                      desktop: screenWidthFraction(
                        context,
                        offsetBy: 370,
                      ),
                    ),
                  ),
                  child: CustomSearchTextField(
                    hintText: 'Cari',
                    onSearch: viewModel.onSearch,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Card(
                elevation: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      ResponsiveDatatable(
                        isLoading: viewModel.isBusy,
                        source: viewModel.source,
                        selecteds: [],
                        expanded: List.filled(viewModel.items.length, false),
                        autoHeight: false,
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
                                value: column.toSnakeCase(),
                                sourceBuilder: column == 'Aksi'
                                    ? (value, row) {
                                        return CustomActionsTableButton(
                                          onEdit: () => viewModel.onEdit(value),
                                          onDelete: () =>
                                              viewModel.onDelete(value),
                                        );
                                      }
                                    : null,
                              ),
                            )
                            .toList(),
                        footers: viewModel.items.isEmpty
                            ? null
                            : [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'Jumlah ${viewModel.table}: ${viewModel.items.length}'),
                                ),
                              ],
                      ),
                      if (viewModel.items.isEmpty)
                        const Align(
                          alignment: Alignment.center,
                          child: Text('Tidak ada data'),
                        ),
                    ],
                  ),
                ),
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
