import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';
import 'package:jadwal_kuliah/ui/common/ui_helpers.dart';
import 'package:jadwal_kuliah/ui/views/pengaturan/pengaturan_viewmodel.dart';
import 'package:jadwal_kuliah/ui/widgets/custom_actions_table_button.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:unicons/unicons.dart';

class CardHariWidget extends ViewModelWidget<PengaturanViewModel> {
  const CardHariWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, PengaturanViewModel viewModel) {
    return SizedBox(
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
            if (viewModel.busy('hari')) const LinearProgressIndicator(),
            SizedBox(
              height: screenHeightFraction(
                context,
                offsetBy: 220,
              ),
              child: ListView.builder(
                itemCount: viewModel.hariItems.length,
                itemBuilder: (context, index) {
                  final item = viewModel.hariItems[index];
                  return ListTile(
                    title: Text(item.hari),
                    subtitle: Text(
                      item.kelas.map((e) => e.toString()).join(', '),
                      style: ktRegularTextStyle.copyWith(
                        color: kcMediumGrey,
                      ),
                    ),
                    trailing: IntrinsicWidth(
                      child: CustomActionsTableButton(
                        onEdit: () => viewModel.onEditHari(item),
                        onDelete: () => viewModel.onDeleteHari(item),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
