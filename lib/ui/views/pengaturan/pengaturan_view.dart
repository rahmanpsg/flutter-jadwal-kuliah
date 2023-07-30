import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'pengaturan_viewmodel.dart';

class PengaturanView extends StackedView<PengaturanViewModel> {
  const PengaturanView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PengaturanViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  PengaturanViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PengaturanViewModel();
}
