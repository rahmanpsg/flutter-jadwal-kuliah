import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/models/dosen_model.dart';
import 'package:jadwal_kuliah/models/matakuliah_model.dart';
import 'package:jadwal_kuliah/models/pengampu_model.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unicons/unicons.dart';

import 'pengampu_form_dialog_model.dart';

class PengampuFormDialogData {
  final PengampuModel? pengampu;

  const PengampuFormDialogData({
    this.pengampu,
  });
}

class PengampuFormDialog extends StackedView<PengampuFormDialogModel> {
  final DialogRequest<PengampuFormDialogData> request;
  final Function(DialogResponse) completer;

  const PengampuFormDialog({
    Key? key,
    DialogRequest? request,
    required this.completer,
  })  : request = request as DialogRequest<PengampuFormDialogData>,
        super(key: key);

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderSide: const BorderSide(
          color: kcBackgroundColor,
        ),
        borderRadius: BorderRadius.circular(12),
      );

  InputDecoration get inputDecoration => InputDecoration(
        fillColor: kcBackgroundColor,
        filled: true,
        enabledBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder.copyWith(
          borderSide: const BorderSide(
            color: kcPrimaryColor,
            width: 1.5,
          ),
        ),
        errorBorder: outlineInputBorder.copyWith(
          borderSide: const BorderSide(
            color: kcDangerColor,
          ),
        ),
        focusedErrorBorder: outlineInputBorder.copyWith(
          borderSide: const BorderSide(
            color: kcDangerColor,
            width: 1.5,
          ),
        ),
      );

  @override
  Widget builder(
    BuildContext context,
    PengampuFormDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      insetPadding: getValueForScreenType<EdgeInsets>(
        context: context,
        mobile: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 24.0,
        ),
        tablet: const EdgeInsets.all(80),
      ),
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                request.title ?? '',
                style: ktMediumTextStyle.copyWith(fontSize: 20),
              ),
              if (request.description != null) ...[
                const SizedBox(height: 8),
                Text(
                  request.description!,
                  style: ktRegularTextStyle.copyWith(fontSize: 14),
                ),
              ],
              const SizedBox(height: 16),
              Text(
                'Tahun Akademik',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              DropdownSearch<String>(
                items: viewModel.tahunAkademikList,
                itemAsString: (item) => item,
                selectedItem: viewModel.tahunAkademik,
                dropdownButtonProps: const DropdownButtonProps(
                  icon: Icon(UniconsLine.angle_down),
                ),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: inputDecoration,
                ),
                onChanged: (v) => viewModel.tahunAkademik = v,
                validator: (v) =>
                    v == null ? 'Tahun Akademik harus dipilih' : null,
                autoValidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 16),
              Text(
                'Matakuliah',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              DropdownSearch<MatakuliahModel>(
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                  itemBuilder: (context, item, isSelected) {
                    return ListTile(
                      title: Text(item.nama),
                      subtitle: Text(
                        '${item.kode} (Semester ${item.semester})',
                        style: ktRegularTextStyle.copyWith(
                          fontSize: 12,
                          color: kcMediumGrey,
                        ),
                      ),
                    );
                  },
                ),
                items: viewModel.matakuliahList,
                itemAsString: (item) => item.nama,
                selectedItem: viewModel.matakuliah,
                dropdownButtonProps: const DropdownButtonProps(
                  icon: Icon(UniconsLine.angle_down),
                ),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: inputDecoration,
                ),
                onChanged: (v) => viewModel.matakuliah = v,
                validator: (v) => v == null ? 'Matakuliah harus dipilih' : null,
                autoValidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 16),
              Text(
                'Dosen',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              DropdownSearch<DosenModel>(
                popupProps: const PopupProps.menu(
                  showSearchBox: true,
                ),
                items: viewModel.dosenList,
                itemAsString: (item) => item.nama,
                selectedItem: viewModel.dosen,
                dropdownButtonProps: const DropdownButtonProps(
                  icon: Icon(UniconsLine.angle_down),
                ),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: inputDecoration,
                ),
                onChanged: (v) => viewModel.dosen = v,
                validator: (v) => v == null ? 'Dosen harus dipilih' : null,
                autoValidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 16),
              Text(
                'Kelas',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              if (viewModel.matakuliah == null)
                Row(
                  children: [
                    const Icon(
                      UniconsLine.info_circle,
                      color: kcMediumGrey,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Pilih matakuliah terlebih dahulu',
                      style: ktRegularTextStyle.copyWith(
                        fontSize: 12,
                        color: kcMediumGrey,
                      ),
                    ),
                  ],
                )
              else
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: viewModel.kelasList
                      .map((e) => e.nama)
                      .expand((e) => e)
                      .map(
                    (nama) {
                      final isSelected = viewModel.kelas.contains(nama);

                      return ChoiceChip(
                        label: Text(
                          nama,
                          style: ktRegularTextStyle.copyWith(
                            fontSize: 12,
                            color: isSelected ? kcWhite : kcMediumGrey,
                          ),
                        ),
                        side: const BorderSide(
                          color: kcPrimaryColor,
                          width: 1.5,
                        ),
                        iconTheme: IconThemeData(
                          color: isSelected ? kcWhite : kcPrimaryColor,
                        ),
                        selected: isSelected,
                        onSelected: (v) => viewModel.onKelasSelected(nama, v),
                      );
                    },
                  ).toList(),
                ),
              if (viewModel.hasErrorForKey('kelas')) ...[
                const SizedBox(height: 8),
                Text(
                  viewModel.error('kelas') ?? '',
                  style: ktRegularTextStyle.copyWith(
                    color: kcDangerColor,
                    fontSize: 12,
                  ),
                )
              ],
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        completer(
                          DialogResponse(
                            confirmed: false,
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: kcDangerColor,
                        foregroundColor: kcWhite,
                      ),
                      icon: const Icon(UniconsLine.times),
                      label: Text(request.secondaryButtonTitle ?? 'Batal'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: ElevatedButton.icon(
                      onPressed: viewModel.onSubmit,
                      icon: const Icon(UniconsLine.save),
                      label: Text(request.mainButtonTitle ?? 'Ok'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  PengampuFormDialogModel viewModelBuilder(BuildContext context) =>
      PengampuFormDialogModel();

  @override
  void onViewModelReady(PengampuFormDialogModel viewModel) {
    viewModel.init(request.data?.pengampu);
    super.onViewModelReady(viewModel);
  }
}
