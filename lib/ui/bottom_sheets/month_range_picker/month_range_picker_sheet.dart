import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'month_range_picker_sheet_model.dart';

class MonthRangePickerSheet extends StackedView<MonthRangePickerSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const MonthRangePickerSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(
    BuildContext context,
    MonthRangePickerSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              request.title ?? 'Select Month Range',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
            verticalSpaceMedium,
            Text(
              viewModel.getFormattedDateRange(),
              style: const TextStyle(fontSize: 16, color: kcMediumGrey),
            ),
            verticalSpaceMedium,
            SizedBox(
              height: 200, // Adjust this value as needed
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: viewModel.startDate,
                      onDateTimeChanged: (DateTime newDate) {
                        viewModel.setStartDate(
                            viewModel.getFirstDayOfMonth(newDate));
                      },
                      minimumYear: 2000,
                      maximumYear: 2100,
                      dateOrder: DatePickerDateOrder.ymd,
                    ),
                  ),
                  horizontalSpaceSmall,
                  Expanded(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: viewModel.endDate,
                      onDateTimeChanged: (DateTime newDate) {
                        viewModel
                            .setEndDate(viewModel.getLastDayOfMonth(newDate));
                      },
                      minimumYear: 2000,
                      maximumYear: 2100,
                      dateOrder: DatePickerDateOrder.ymd,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () =>
                      completer?.call(SheetResponse(confirmed: false)),
                  child: const Text('Cancel'),
                ),
                horizontalSpaceSmall,
                ElevatedButton(
                  onPressed: () => completer?.call(SheetResponse(
                    confirmed: true,
                    data: {
                      'startDate': viewModel.startDate,
                      'endDate': viewModel.endDate,
                    },
                  )),
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  MonthRangePickerSheetModel viewModelBuilder(BuildContext context) =>
      MonthRangePickerSheetModel();
}
