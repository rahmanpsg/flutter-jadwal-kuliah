import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jadwal_kuliah/models/jam_model.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';
import 'package:jadwal_kuliah/ui/common/ui_helpers.dart';
import 'package:jadwal_kuliah/ui/views/pengaturan/pengaturan_viewmodel.dart';
import 'package:jadwal_kuliah/ui/widgets/custom_textfield_outline.dart';
import 'package:jadwal_kuliah/utils/datetime.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:unicons/unicons.dart';

class CardJamWidget extends ViewModelWidget<PengaturanViewModel> {
  const CardJamWidget({
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
                UniconsLine.clock,
                color: kcWhite,
              ),
              title: const Text('Jam'),
              trailing: IconButton(
                onPressed: viewModel.onAddJam,
                icon: const Icon(
                  UniconsLine.refresh,
                  color: kcWhite,
                ),
              ),
            ),
            if (viewModel.busy('jam')) const LinearProgressIndicator(),
            SizedBox(
              height: screenHeightFraction(
                context,
                offsetBy: 220,
              ),
              child: ListView.builder(
                itemCount: viewModel.jamItems.length,
                primary: false,
                itemBuilder: (context, index) {
                  final item = viewModel.jamItems[index];

                  return _JamItemWidget(
                    key: ValueKey(item.id),
                    item: item,
                    onChanged: (value) {
                      viewModel.onSetAktifJam(
                        item,
                        value ?? false,
                      );
                    },
                    onSavedKeterangan: (value) {
                      viewModel.onSetKeteranganJam(
                        item,
                        value,
                      );
                    },
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

class _JamItemWidget extends HookWidget {
  final JamModel item;
  final Function(bool?)? onChanged;
  final Function(String)? onSavedKeterangan;

  const _JamItemWidget({
    super.key,
    required this.item,
    this.onChanged,
    this.onSavedKeterangan,
  });

  @override
  Widget build(BuildContext context) {
    final keteranganController = useTextEditingController(
      text: item.keterangan,
    );

    final isHovering = useState(false);
    final isAdding = useState(false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHovering.value = true,
      onExit: (_) => isHovering.value = false,
      child: ListTile(
        leading: Checkbox(
          value: item.aktif,
          onChanged: onChanged,
          checkColor: kcWhite,
          fillColor: MaterialStateProperty.all(
            kcPrimaryColor,
          ),
          side: const BorderSide(
            color: kcPrimaryColor,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(
              color: kcPrimaryColor,
              width: 1.5,
            ),
          ),
        ),
        title: Text(
          '${DateTimeUtils.timeOfDayToString(item.mulai)} - ${DateTimeUtils.timeOfDayToString(item.selesai)}',
          style: ktRegularTextStyle.copyWith(
            color: item.aktif ? kcPrimaryColor : kcMediumGrey,
          ),
        ),
        subtitle: isAdding.value
            ? CustomTextFieldOutline(
                controller: keteranganController,
                hintText: 'Keterangan',
                onFieldSubmitted: (v) {
                  onSavedKeterangan?.call(keteranganController.text);
                  isAdding.value = false;
                  isHovering.value = false;

                  // remove all focus
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                prefixIcon: IconButton(
                  onPressed: () {
                    onSavedKeterangan?.call(keteranganController.text);
                    isAdding.value = false;
                    isHovering.value = false;

                    // remove all focus
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  icon: const Icon(UniconsLine.save),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    isAdding.value = false;
                    isHovering.value = false;

                    // remove all focus
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  icon: const Icon(UniconsLine.times),
                ),
                outlineColor: kcSecondaryColor,
              )
            : item.keterangan != null
                ? Row(
                    children: [
                      if (isHovering.value)
                        IconButton(
                          onPressed: () => isAdding.value = true,
                          icon: const Icon(
                            UniconsLine.pen,
                            size: 16,
                          ),
                        ).animate().moveX(),
                      Text(
                        item.keterangan!,
                        style: ktRegularTextStyle.copyWith(
                          fontSize: 12,
                          color: kcMediumGrey,
                        ),
                      ),
                    ],
                  )
                : isHovering.value
                    ? OutlinedButton.icon(
                        onPressed: () => isAdding.value = true,
                        icon: const Icon(UniconsLine.plus),
                        label: const Text('Keterangan'),
                      ).animate().fade()
                    : null,
      ),
    );
  }
}
