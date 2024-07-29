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
            SizedBox(
              height: 200, // Adjust this value as needed
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 32.0,
                      scrollController: FixedExtentScrollController(
                        initialItem: viewModel.startDate.month - 1,
                      ),
                      onSelectedItemChanged: (int index) {
                        viewModel.setStartDate(DateTime(
                          viewModel.startDate.year,
                          index + 1,
                          1,
                        ));
                      },
                      children: viewModel.months
                          .map((month) => Center(child: Text(month)))
                          .toList(),
                    ),
                  ),
                  horizontalSpaceSmall,
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 32.0,
                      scrollController: FixedExtentScrollController(
                        initialItem: viewModel.endDate.month - 1,
                      ),
                      onSelectedItemChanged: (int index) {
                        viewModel.setEndDate(DateTime(
                          viewModel.endDate.year,
                          index + 1,
                          viewModel.getLastDayOfMonth(DateTime(viewModel.endDate.year, index + 1)).day,
                        ));
                      },
                      children: viewModel.months
                          .map((month) => Center(child: Text(month)))
                          .toList(),
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
