// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/form/form_dialog.dart';
import '../ui/dialogs/pengampu_form/pengampu_form_dialog.dart';

enum DialogType {
  form,
  pengampuForm,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.form: (context, request, completer) =>
        FormDialog(request: request, completer: completer),
    DialogType.pengampuForm: (context, request, completer) =>
        PengampuFormDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
