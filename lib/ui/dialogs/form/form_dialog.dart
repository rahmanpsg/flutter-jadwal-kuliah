import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jadwal_kuliah/models/item_model.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';
import 'package:jadwal_kuliah/ui/widgets/custom_textfield_outline.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unicons/unicons.dart';

import 'form_dialog_model.dart';

class FormDialogItem {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final Function()? onTap;
  final bool isDropdown;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  FormDialogItem({
    TextEditingController? controller,
    required this.label,
    this.hint,
    this.onTap,
    this.isDropdown = false,
    this.keyboardType,
    this.inputFormatters,
  }) : controller = controller ?? TextEditingController();
}

class FormDialogData {
  final List<FormDialogItem> formDialogItems;

  FormDialogData({required this.formDialogItems});
}

class FormDialog extends StackedView<FormDialogModel> {
  final DialogRequest<FormDialogData> request;
  final Function(DialogResponse) completer;

  const FormDialog({
    Key? key,
    DialogRequest? request,
    required this.completer,
  })  : request = request as DialogRequest<FormDialogData>,
        super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FormDialogModel viewModel,
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
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Form(
          key: viewModel.formKey,
          autovalidateMode: viewModel.autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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
              const SizedBox(
                height: 16,
              ),
              Flexible(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: request.data!.formDialogItems.length,
                    itemBuilder: (context, index) {
                      final field =
                          request.data!.formDialogItems.elementAt(index);

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(field.label,
                              style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(height: 8),
                          CustomTextFieldOutline(
                            controller: field.controller,
                            hintText: field.hint,
                            onTap: () async {
                              final ItemModel? response =
                                  await field.onTap?.call();

                              if (response == null) return;

                              field.controller.text = response.label;

                              viewModel.mapResponse.putIfAbsent(
                                  field.label, () => response.value);

                              viewModel.rebuildUi();
                            },
                            keyboardType: field.keyboardType,
                            inputFormatters: field.inputFormatters,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Silahkan ${field.isDropdown ? 'pilih' : 'masukkan'} ${field.label.toLowerCase()}';
                              }
                              return null;
                            },
                            readOnly: field.isDropdown,
                            suffixIcon: !field.isDropdown
                                ? null
                                : const IntrinsicWidth(
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_drop_down_rounded,
                                      ),
                                    ),
                                  ),
                            onFieldSubmitted: (v) {
                              if (index ==
                                  request.data!.formDialogItems.length - 1) {
                                viewModel.onSubmit();
                              }
                            },
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16)),
              ),
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
                      label: Text(request.secondaryButtonTitle ?? 'Cancel'),
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
  FormDialogModel viewModelBuilder(BuildContext context) => FormDialogModel();

  @override
  void onViewModelReady(FormDialogModel viewModel) {
    viewModel.init(request.data!);
    super.onViewModelReady(viewModel);
  }
}
