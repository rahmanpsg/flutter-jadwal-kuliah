import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'form_dialog.dart';

class FormDialogModel extends BaseViewModel {
  final log = getLogger('FormDialogModel');

  final _routerService = locator<RouterService>();

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late final FormDialogData formDialogData;

  late Map mapResponse = <String, dynamic>{};

  void init(FormDialogData formDialogData) {
    this.formDialogData = formDialogData;
  }

  bool isValid() {
    for (var field in formDialogData.formDialogItems) {
      if (field.isChipChoice != true) continue;

      setErrorForObject(field.label, null);

      log.d("mapResponse: $mapResponse");

      if (mapResponse.containsKey(field.label) == false ||
          mapResponse[field.label]?.isNotEmpty == false) {
        setErrorForObject(field.label, true);
        return false;
      }
    }
    return formKey.currentState!.validate();
  }

  void onSubmit() async {
    if (!isValid()) {
      autovalidateMode = AutovalidateMode.onUserInteraction;
      return;
    }

    // assign the values to the mapResponse
    for (var field in formDialogData.formDialogItems) {
      if (field.isDropdown) {
        if (mapResponse.containsKey(field.label) == false) {
          mapResponse[field.label] = field.dropdownItems
              ?.firstWhere((element) => element.label == field.controller.text)
              .value;
        }
        continue;
      }

      if (field.isChipInput || field.isChipChoice) {
        if (mapResponse.containsKey(field.label) == false) {
          mapResponse[field.label] = field.chipItems;
        }

        continue;
      }
      mapResponse[field.label] = field.controller.text;
    }

    _routerService.pop(
      DialogResponse(
        confirmed: true,
        data: mapResponse,
      ),
    );
  }

  @override
  void dispose() {
    for (var field in formDialogData.formDialogItems) {
      field.controller.dispose();
    }
    super.dispose();
  }
}
