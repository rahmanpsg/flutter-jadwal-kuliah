import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({super.key});

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      final isMobile =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile;

      return Scaffold(
        appBar: isMobile
            ? AppBar(
                title: Text(
                  'Jadwal Kuliah Menggunakan Algoritma Ant Colony Optimization',
                  style: ktRegularTextStyle.copyWith(
                    color: kcFontColorDark,
                  ),
                ),
                centerTitle: true,
                backgroundColor: kcPrimaryColor,
                iconTheme: const IconThemeData(
                  color: kcFontColorDark,
                ),
              )
            : null,
        drawer: isMobile
            ? Drawer(
                child: ListView(
                  children: [
                    DrawerHeader(
                      child: Column(
                        children: [
                          Image.asset('assets/images/logo.png', width: 60),
                          const SizedBox(height: 8),
                          Text(
                            "UM-Parepare",
                            style:
                                ktRegularTextStyle.copyWith(color: kcFontColor),
                          ),
                        ],
                      ),
                    ),
                    ...viewModel.items
                        .map(
                          (item) => ListTile(
                            selected: viewModel.currentIndex ==
                                viewModel.items.indexOf(item),
                            leading: Icon(item.icon),
                            title: Text(item.label),
                            onTap: () {
                              viewModel.handleNavigation(
                                  viewModel.items.indexOf(item));
                              Navigator.pop(context);
                            },
                          ),
                        )
                        .toList(),
                  ],
                ),
              )
            : null,
        body: Row(
          children: [
            if (!isMobile)
              NavigationRail(
                selectedIndex: viewModel.currentIndex,
                onDestinationSelected: viewModel.handleNavigation,
                backgroundColor: Theme.of(context).colorScheme.background,
                indicatorColor: Theme.of(context).colorScheme.primary,
                elevation: 10,
                useIndicator: true,
                labelType: NavigationRailLabelType.selected,
                minExtendedWidth: 150,
                selectedIconTheme: const IconThemeData(
                  color: kcWhite,
                ),
                unselectedIconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                selectedLabelTextStyle: Theme.of(context).textTheme.bodyMedium,
                unselectedLabelTextStyle:
                    Theme.of(context).textTheme.bodyMedium,
                leading: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    children: [
                      Image.asset('assets/images/logo.png', width: 60),
                      const SizedBox(height: 8),
                      Text(
                        "UM-Parepare",
                        style: ktRegularTextStyle.copyWith(color: kcFontColor),
                      ),
                    ],
                  ),
                ),
                destinations: viewModel.items
                    .map(
                      (item) => NavigationRailDestination(
                        icon: Tooltip(
                          message: item.label,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(item.icon),
                        ),
                        label: Text(item.label),
                      ),
                    )
                    .toList(),
              ).animate().fadeIn().moveX(),
            Expanded(
              child: Column(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: NestedRouter(),
                    ),
                  ),
                  Container(
                    height: 30,
                    color: kcPrimaryColor,
                    child: Center(
                      child: Text(
                        "© 2023 Universitas Muhammadiyah Parepare",
                        style: ktRegularTextStyle.copyWith(
                          color: kcWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
