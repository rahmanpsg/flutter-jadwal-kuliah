import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_viewmodel.dart';

class DashboardViewMobile extends ViewModelWidget<DashboardViewModel> {
  const DashboardViewMobile({super.key});

  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            viewModel.items[viewModel.currentIndex]['label'],
            style: ktRegularTextStyle.copyWith(
              color: kcFontColorDark,
            ),
          ),
          centerTitle: true,
          backgroundColor: kcPrimaryColor,
          iconTheme: const IconThemeData(
            color: kcFontColorDark,
          )),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
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
            ...viewModel.items
                .map(
                  (item) => ListTile(
                    selected:
                        viewModel.currentIndex == viewModel.items.indexOf(item),
                    leading: Icon(item['icon']),
                    title: Text(item['label']),
                    onTap: () {
                      viewModel.handleNavigation(viewModel.items.indexOf(item));
                      Navigator.pop(context);
                    },
                  ),
                )
                .toList(),
          ],
        ),
      ),
      body: NestedRouter(navigatorKey: viewModel.navigatorKey),
    );
  }
}
