import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'pengaturan_viewmodel.dart';
import 'widgets/card_hari_widget.dart';
import 'widgets/card_jam_widget.dart';

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
              const Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceEvenly,
                      runAlignment: WrapAlignment.spaceBetween,
                      runSpacing: 16,
                      children: [
                        CardHariWidget(),
                        CardJamWidget(),
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
