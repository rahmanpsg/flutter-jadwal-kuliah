import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_viewmodel.dart';

class DashboardViewDesktop extends ViewModelWidget<DashboardViewModel> {
  const DashboardViewDesktop({super.key});

  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcWhite,
      body: Row(
        children: [
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
            unselectedLabelTextStyle: Theme.of(context).textTheme.bodyMedium,
            destinations: viewModel.items
                .map((item) => NavigationRailDestination(
                      icon: Icon(item['icon']),
                      label: Text(item['label']),
                    ))
                .toList(),
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: NestedRouter(
                navigatorKey: viewModel.navigatorKey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
