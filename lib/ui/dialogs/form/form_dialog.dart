import 'package:collection/collection.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jadwal_kuliah/models/item_model.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';
import 'package:jadwal_kuliah/ui/widgets/custom_textfield_outline.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unicons/unicons.dart';

import 'form_dialog_model.dart';

class FormDialogData<T> {
  final List<FormDialogItem<T>> formDialogItems;

  FormDialogData({required this.formDialogItems});
}

class FormDialogItem<T> {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final Function()? onTap;
  final bool isDropdown;
  final List<ItemModel<T>>? dropdownItems;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;
  final bool isChipInput;
  final bool isChipChoice;
  final List<ItemModel<T>>? chipItems;

  FormDialogItem({
    TextEditingController? controller,
    required this.label,
    this.hint,
    this.onTap,
    this.isDropdown = false,
    this.dropdownItems,
    this.keyboardType,
    this.inputFormatters,
    this.isRequired = true,
    this.isChipInput = false,
    this.isChipChoice = false,
    this.chipItems,
  })  : controller = controller ?? TextEditingController(),
        assert(!isDropdown || dropdownItems != null,
            'Dropdown items are required when isDropdown is true'),
        assert(!isChipInput || chipItems != null,
            'Chip items are required when isChipInput is true'),
        assert(!isChipChoice || chipItems != null,
            'Chip items are required when isChipChoice is true');
}

class FormDialog extends StackedView<FormDialogModel> {
  final DialogRequest<FormDialogData> request;
  final Function(DialogResponse) completer;

  const FormDialog({
    super.key,
    DialogRequest? request,
    required this.completer,
  }) : request = request as DialogRequest<FormDialogData>;

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

                      return _FieldHook(field: field, request: request);
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
  FormDialogModel viewModelBuilder(BuildContext context) => FormDialogModel();

  @override
  void onViewModelReady(FormDialogModel viewModel) {
    viewModel.init(request.data!);
    super.onViewModelReady(viewModel);
  }
}

class _FieldHook extends StackedHookView<FormDialogModel> {
  final FormDialogItem field;
  final DialogRequest<FormDialogData> request;

  const _FieldHook({
    required this.field,
    required this.request,
  });

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderSide: const BorderSide(
          color: kcBackgroundColor,
        ),
        borderRadius: BorderRadius.circular(12),
      );

  InputDecoration get inputDecoration => InputDecoration(
        fillColor: kcBackgroundColor,
        filled: true,
        hintText: field.hint,
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
  Widget builder(BuildContext context, FormDialogModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(field.label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 8),
        if (field.isChipInput)
          const SizedBox()
        // ChipsInput<ItemModel>(
        //   initialValue: field.chipItems ?? [],
        //   findSuggestions: (String query) {
        //     final results = field.chipItems!.where((item) {
        //       return item.value.toLowerCase().contains(query.toLowerCase());
        //     }).toList();

        //     if (results.isEmpty) {
        //       return [
        //         ItemModel(
        //           label: query.toUpperCase(),
        //           value: query.toUpperCase(),
        //         ),
        //       ];
        //     }

        //     return results;
        //   },
        //   inputFormatters: field.inputFormatters,
        //   keyboardType: field.keyboardType,
        //   onChanged: (data) {
        //     viewModel.mapResponse[field.label] = data;

        //     viewModel.rebuildUi();
        //   },
        //   decoration: inputDecoration,
        //   chipBuilder: (context, state, ItemModel item) {
        //     return Container(
        //       padding: const EdgeInsets.symmetric(
        //         vertical: 4,
        //         horizontal: 8,
        //       ),
        //       decoration: BoxDecoration(
        //         color: kcSecondaryColor,
        //         borderRadius: BorderRadius.circular(12),
        //         border: Border.all(
        //           color: kcPrimaryColor,
        //           width: 1.5,
        //         ),
        //       ),
        //       child: Row(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Text(
        //             item.label,
        //             style: ktRegularTextStyle.copyWith(
        //               fontSize: 14,
        //               color: kcWhite,
        //             ),
        //           ),
        //           const SizedBox(width: 8),
        //           InkWell(
        //             onTap: () => state.deleteChip(item),
        //             child: const Icon(
        //               UniconsLine.times,
        //               size: 14,
        //               color: kcWhite,
        //             ),
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        //   suggestionBuilder: (context, ItemModel item) {
        //     return ListTile(
        //       key: ObjectKey(item),
        //       title: Text(item.label),
        //     );
        //   },
        // )
        else if (field.isChipChoice) ...[
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: field.chipItems!.map(
              (item) {
                final isSelected =
                    (viewModel.mapResponse[field.label] as List<dynamic>?)
                            ?.contains(item.value) ??
                        item.isSelected;

                return ChoiceChip(
                  label: Text(
                    item.label,
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
                  onSelected: (v) {
                    viewModel.mapResponse.putIfAbsent(
                        field.label,
                        () => [
                              for (var item in field.chipItems!)
                                if (item.isSelected) item.value
                            ]);

                    if (v) {
                      viewModel.mapResponse[field.label].add(item.value);

                      viewModel.setErrorForObject(field.label, null);
                    } else {
                      viewModel.mapResponse[field.label].remove(item.value);
                    }

                    viewModel.log.d("mapResponse: ${viewModel.mapResponse}");

                    viewModel.rebuildUi();
                  },
                );
              },
            ).toList(),
          ),
          if (viewModel.hasErrorForKey(field.label))
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                top: 4.0,
              ),
              child: Text(
                'Silahkan pilih ${field.label.toLowerCase()}',
                style: ktRegularTextStyle.copyWith(
                  fontSize: 12,
                  color: kcDangerColor,
                ),
              ),
            ),
        ] else if (field.isDropdown)
          DropdownSearch<ItemModel>(
            items: field.dropdownItems ?? [],
            itemAsString: (item) => item.label,
            dropdownButtonProps: const DropdownButtonProps(
              icon: Icon(UniconsLine.angle_down),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: inputDecoration,
            ),
            onChanged: (value) {
              viewModel.mapResponse[field.label] = value?.value;
            },
            selectedItem: field.dropdownItems?.firstWhereOrNull(
              (element) => element.label == field.controller.text,
            ),
            validator: field.isRequired
                ? (value) {
                    if (value == null) {
                      return 'Silahkan pilih ${field.label.toLowerCase()}';
                    }
                    return null;
                  }
                : null,
          )
        else
          CustomTextFieldOutline(
            controller: field.controller,
            hintText: field.hint,
            onTap: () async {
              final ItemModel? response = await field.onTap?.call();

              if (response == null) return;

              field.controller.text = response.label;

              viewModel.mapResponse
                  .putIfAbsent(field.label, () => response.value);

              viewModel.rebuildUi();
            },
            readOnly: field.onTap != null,
            keyboardType: field.keyboardType,
            inputFormatters: field.inputFormatters,
            validator: (value) {
              if (field.isRequired) {
                if (value == null || value.isEmpty) {
                  return 'Silahkan ${field.isDropdown ? 'pilih' : 'masukkan'} ${field.label.toLowerCase()}';
                }
              }
              return null;
            },
          )
      ],
    );
  }
}
