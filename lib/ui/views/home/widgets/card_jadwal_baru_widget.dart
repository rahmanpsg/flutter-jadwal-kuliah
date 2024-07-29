import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jadwal_kuliah/enums/semester_type.dart';
import 'package:jadwal_kuliah/extensions/string_extension.dart';
import 'package:jadwal_kuliah/models/program_studi_model.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';
import 'package:jadwal_kuliah/ui/views/home/home_viewmodel.dart';
import 'package:jadwal_kuliah/ui/widgets/custom_timer.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class CardJadwalBaruWidget extends StackedHookView<HomeViewModel> {
  const CardJadwalBaruWidget({super.key});

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderSide: const BorderSide(
          color: kcBlack,
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
  Widget builder(BuildContext context, HomeViewModel viewModel) {
    final scrollController = useScrollController();

    useEffect(() {
      if (viewModel.generateJadwalList.isEmpty) return;

      Future.delayed(const Duration(milliseconds: 300), () {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });

      return;
    }, [viewModel.generateJadwalList.length]);

    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownSearch<ProgramStudiModel>(
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: inputDecoration.copyWith(
                hintText: '- Pilih Program Studi -',
              ),
            ),
            items: viewModel.programStudiList,
            itemAsString: (item) => item.nama.toUpperCase(),
            onChanged: (v) => viewModel.programStudi = v,
          ),
          const SizedBox(height: 8),
          DropdownSearch<SemesterType>(
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: inputDecoration.copyWith(
                hintText: '- Pilih Semester -',
              ),
            ),
            items: SemesterType.values,
            itemAsString: (item) => item.name.toUpperCase(),
            onChanged: (v) => viewModel.semester = v,
          ),
          const SizedBox(height: 8),
          DropdownSearch<String>(
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: inputDecoration.copyWith(
                hintText: '- Pilih Tahun Akademik -',
              ),
            ),
            asyncItems: (_) => viewModel.getTahunAkademik(),
            onChanged: (v) => viewModel.tahunAkademik = v,
          ),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: viewModel.jumlahIterasi.toString(),
            decoration: inputDecoration.copyWith(
              labelText: 'Maksimal Iterasi',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              // minimum length 1
              TextInputFormatter.withFunction(
                (oldValue, newValue) =>
                    newValue.text.isEmpty ? oldValue : newValue,
              ),
            ],
            onChanged: (v) => viewModel.jumlahIterasi = int.parse(v),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: kcPrimaryColor.withOpacity(.3),
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed:
                !viewModel.busy('onGenerate') ? viewModel.onGenerate : null,
            icon: viewModel.busy('onGenerate')
                ? const SizedBox.square(
                    dimension: 25,
                    child: CircularProgressIndicator(),
                  )
                : const Icon(Icons.switch_access_shortcut_add_rounded),
            label: const Text('Generate Jadwal Baru'),
          ),
          if (viewModel.startDateTime != null) ...[
            const SizedBox(height: 8),
            CustomTimer(
              start: viewModel.startDateTime!,
              paused: !viewModel.busy('onGenerate'),
            )
          ],

          // create log container
          if (viewModel.logs.isNotEmpty) ...[
            const SizedBox(height: 8),
            _LogsHook(
              logs: viewModel.logs,
            ),
          ],

          if (viewModel.generateJadwalList.isNotEmpty) ...[
            const SizedBox(height: 24),
            SizedBox(
              height: 500,
              child: ResponsiveDatatable(
                isLoading: viewModel.isBusy,
                source: viewModel.source,
                selecteds: const [],
                expanded:
                    List.filled(viewModel.generateJadwalList.length, false),
                autoHeight: false,
                headerDecoration: const BoxDecoration(
                  color: kcSecondaryColor,
                ),
                headerTextStyle:
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: kcWhite,
                        ),
                headers: viewModel.columns
                    .map(
                      (column) => DatatableHeader(
                        text: column,
                        value: column.toSnakeCase(),
                      ),
                    )
                    .toList(),
                footers: viewModel.generateJadwalList.isEmpty
                    ? null
                    : [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Jumlah jadwal: ${viewModel.generateJadwalList.length}'),
                        ),
                      ],
              ),
            )
          ]
        ],
      ),
    );
  }
}

class _LogsHook extends HookWidget {
  final List<String> logs;

  const _LogsHook({
    required this.logs,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    useEffect(() {
      if (!scrollController.hasClients) return;

      Future.delayed(const Duration(milliseconds: 300), () {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.linear,
        );
      });

      return null;
    }, [logs.length]);

    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcPrimaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.separated(
        controller: scrollController,
        itemCount: logs.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final log = logs[index];

          return Text(
            log,
            style: ktRegularTextStyle,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8),
      ),
    );
  }
}
