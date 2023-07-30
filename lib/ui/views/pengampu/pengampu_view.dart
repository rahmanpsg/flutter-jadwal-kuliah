import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'pengampu_viewmodel.dart';

class PengampuView extends StackedView<PengampuViewModel> {
  const PengampuView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PengampuViewModel viewModel,
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
  PengampuViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PengampuViewModel();
}
