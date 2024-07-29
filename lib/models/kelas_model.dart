// ignore_for_file: invalid_annotation_target

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jadwal_kuliah/enums/kelas_type.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/services/periode_semester_service.dart';
import 'package:uuid/uuid.dart';

part 'kelas_model.freezed.dart';
part 'kelas_model.g.dart';

@freezed
class KelasModel with _$KelasModel {
  const KelasModel._();

  const factory KelasModel({
    required final String id,
    required final List<String> nama,
    required final int tahunAngkatan,
    @JsonKey(
      fromJson: KelasType.fromInt,
      toJson: KelasType.toInt,
    )
    required final KelasType jenis,
    final String? idProgramStudi,
  }) = _KelasModel;

  factory KelasModel.fromJson(Map<String, Object?> json) =>
      _$KelasModelFromJson(json);

  factory KelasModel.create({
    required List<String> nama,
    required int tahunAngkatan,
    required KelasType jenis,
    String? idProgramStudi,
  }) =>
      KelasModel(
        id: const Uuid().v4(),
        nama: nama,
        tahunAngkatan: tahunAngkatan,
        jenis: jenis,
        idProgramStudi: idProgramStudi,
      );

  int get semester {
    final periodeSemesterService = locator<PeriodeSemesterService>();
    final now = DateTime.now();
    final tahun = now.year;
    final bulan = now.month;

    final tahunAngkatan = this.tahunAngkatan;
    int semester;

    // Calculate the number of years since enrollment
    int yearsSinceEnrollment = tahun - tahunAngkatan;
    
    // Adjust for the academic year starting in August
    if (bulan < 8) {
      yearsSinceEnrollment--;
    }

    // Calculate the base semester
    semester = yearsSinceEnrollment * 2 + 1;

    final ganjil = periodeSemesterService.ganjil;
    final genap = periodeSemesterService.genap;

    if (ganjil != null && genap != null) {
      if (bulan >= ganjil.startMonth && bulan <= ganjil.endMonth) {
        // We're in the odd semester
        return semester;
      } else if (bulan >= genap.startMonth && bulan <= genap.endMonth) {
        // We're in the even semester
        return semester + 1;
      }
    }

    // Fallback logic if PeriodeSemesterService data is not available
    if (bulan >= 8 || bulan <= 1) {
      // Odd semester (August to January)
      return semester;
    } else {
      // Even semester (February to July)
      return semester + 1;
    }
  }

  List<int> getSemesterList() {
    List<List<int>> semesterList = [
      [1, 2],
      [3, 4],
      [5, 6],
      [7, 8],
      [9, 10],
      [11, 12],
      [13, 14]
    ];

    final semester = this.semester;

    // get containing semester
    return semesterList
            .firstWhereOrNull((element) => element.contains(semester)) ??
        [semester];
  }
}
