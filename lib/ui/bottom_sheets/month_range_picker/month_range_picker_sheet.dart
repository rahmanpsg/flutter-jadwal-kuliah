import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'month_range_picker_sheet_model.dart';

class MonthRangePickerSheetData {
  final int startMonth;
  final int endMonth;

  MonthRangePickerSheetData({required this.startMonth, required this.endMonth});
}

class MonthRangePickerSheet extends StackedView<MonthRangePickerSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const MonthRangePickerSheet({
    super.key,
    required this.completer,
    SheetRequest? request,
  }) : request = request as SheetRequest<MonthRangePickerSheetData>;

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
              request.title ?? 'Pilih Rentang Bulan',
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
                        initialItem: viewModel.startMonth - 1,
                      ),
                      onSelectedItemChanged: (int index) {
                        viewModel.setStartMonth(index + 1);
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
                        initialItem: viewModel.endMonth - 1,
                      ),
                      onSelectedItemChanged: (int index) {
                        viewModel.setEndMonth(index + 1);
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
                  child: const Text('Batal'),
                ),
                horizontalSpaceSmall,
                ElevatedButton(
                  onPressed: () => completer?.call(SheetResponse(
                    confirmed: true,
                    data: {
                      'startMonth': viewModel.startMonth,
                      'endMonth': viewModel.endMonth,
                    },
                  )),
                  child: const Text('Konfirmasi'),
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

  @override
  void onViewModelReady(MonthRangePickerSheetModel viewModel) {
    viewModel.init(request.data.startMonth, request.data.endMonth);
    super.onViewModelReady(viewModel);
  }
}
