import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';
import 'package:jadwal_kuliah/ui/common/ui_helpers.dart';
import 'package:jadwal_kuliah/ui/widgets/custom_actions_table_button.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:unicons/unicons.dart';

import 'pengaturan_viewmodel.dart';

class PengaturanView extends StackedView<PengaturanViewModel> {
  const PengaturanView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PengaturanViewModel viewModel,
    Widget? child,
  ) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DefaultTabController(
          length: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pengaturan',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceEvenly,
                      runAlignment: WrapAlignment.spaceBetween,
                      runSpacing: 16,
                      children: [
                        SizedBox(
                          width: getValueForScreenType<double>(
                            context: context,
                            mobile: double.infinity,
                            desktop: halfScreenWidth(
                                  context,
                                ) *
                                .85,
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
                                    UniconsLine.calender,
                                    color: kcWhite,
                                  ),
                                  title: const Text('Hari'),
                                  trailing: IconButton(
                                    onPressed: viewModel.onAddHari,
                                    icon: const Icon(
                                      UniconsLine.plus,
                                      color: kcWhite,
                                    ),
                                  ),
                                ),
                                if (viewModel.busy('hari'))
                                  const LinearProgressIndicator(),
                                SizedBox(
                                  height: screenHeightFraction(
                                    context,
                                    offsetBy: 220,
                                  ),
                                  child: Scrollbar(
                                    child: ListView.builder(
                                      itemCount: viewModel.hariItems.length,
                                      itemBuilder: (context, index) {
                                        final item = viewModel.hariItems[index];
                                        return ListTile(
                                          title: Text(item.hari),
                                          subtitle: Text(
                                            item.kelas
                                                .map((e) => e.toString())
                                                .join(', '),
                                            style: ktRegularTextStyle.copyWith(
                                              color: kcMediumGrey,
                                            ),
                                          ),
                                          trailing: IntrinsicWidth(
                                            child: CustomActionsTableButton(
                                              onEdit: () =>
                                                  viewModel.onEditHari(item),
                                              onDelete: () =>
                                                  viewModel.onDeleteHari(item),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getValueForScreenType<double>(
                            context: context,
                            mobile: double.infinity,
                            desktop: halfScreenWidth(
                                  context,
                                ) *
                                .85,
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
                                    UniconsLine.clock,
                                    color: kcWhite,
                                  ),
                                  title: const Text('Jam'),
                                  trailing: IconButton(
                                    onPressed: viewModel.onAddJam,
                                    icon: const Icon(
                                      UniconsLine.plus,
                                      color: kcWhite,
                                    ),
                                  ),
                                ),
                                // const Divider(),
                                SizedBox(
                                  height: screenHeightFraction(
                                    context,
                                    offsetBy: 220,
                                  ),
                                  child: Scrollbar(
                                    child: ListView.builder(
                                      itemCount: viewModel.jamItems.length,
                                      itemBuilder: (context, index) {
                                        final item = viewModel.jamItems[index];
                                        return ListTile(
                                          title: Text(
                                              '${item.mulai} - ${item.selesai}'),
                                          trailing: CustomActionsTableButton(
                                            onEdit: () =>
                                                viewModel.onEditJam(item),
                                            onDelete: () =>
                                                viewModel.onDeleteJam(item),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  PengaturanViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PengaturanViewModel();

  @override
  void onViewModelReady(PengaturanViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
