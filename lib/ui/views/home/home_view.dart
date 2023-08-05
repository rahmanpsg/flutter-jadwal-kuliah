import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/widgets/custom_stats.dart';
import 'package:stacked/stacked.dart';
import 'package:unicons/unicons.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      children: [
        Card(
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    CustomStats(
                      text: 'Total Dosen',
                      total: viewModel.totalDosen,
                      iconData: UniconsLine.user_nurse,
                      color: kcPrimaryColor,
                    ),
                    CustomStats(
                      text: 'Total Matakuliah',
                      total: viewModel.totalMatakuliah,
                      iconData: UniconsLine.book_alt,
                      color: kcPrimaryColorDark,
                    ),
                    CustomStats(
                      text: 'Total Ruangan',
                      total: viewModel.totalRuangan,
                      iconData: UniconsLine.building,
                      color: kcTertiaryColor,
                    ),
                    CustomStats(
                      text: 'Total Kelas',
                      total: viewModel.totalKelas,
                      iconData: UniconsLine.square_full,
                      color: kcDangerColor,
                    ),
                    CustomStats(
                      text: 'Total Program Studi',
                      total: viewModel.totalProgramStudi,
                      iconData: UniconsLine.graduation_cap,
                      color: kcGreenColor,
                    ),
                    CustomStats(
                      text: 'Total Fakultas',
                      total: viewModel.totalFakultas,
                      iconData: UniconsLine.university,
                      color: kcPurpleColor,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: kcVeryLightGrey,
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          indicatorColor: kcPrimaryColor,
                          labelColor: kcWhite,
                          unselectedLabelColor: kcDarkGreyColor,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: kcPrimaryColorDark,
                          ),
                          indicatorPadding: const EdgeInsets.symmetric(
                            horizontal: -20,
                            vertical: 4,
                          ),
                          dividerColor: kcVeryLightGrey,
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: [
                            Tab(
                              text: 'Generate Jadwal Baru',
                              icon: Icon(
                                UniconsThinline.calender,
                              ),
                            ),
                            Tab(
                              text: 'Jadwal yang Telah Di-Generate',
                              icon: Icon(
                                UniconsThinline.calender,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              // Widget untuk generate jadwal baru
                              Center(child: Text('Generate Jadwal Baru')),
                              // Widget untuk jadwal yang telah di-generate
                              Center(
                                  child: Text('Jadwal yang Telah Di-Generate')),
                            ],
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
        if (viewModel.isBusy)
          const Positioned.fill(
            child: SizedBox.square(
              dimension: 40,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
      ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
