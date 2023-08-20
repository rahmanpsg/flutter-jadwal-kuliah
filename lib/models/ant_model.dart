import 'dart:math';

import 'package:jadwal_kuliah/enums/kelas_type.dart';
import 'package:jadwal_kuliah/models/pengampu_jadwal_model.dart';

import 'ant_jadwal_model.dart';
import 'ruangan_model.dart';
import 'time_slot_model.dart';

class AntModel {
  AntJadwalModel jadwal;
  List<PengampuJadwalModel> pengampuJadwalList;
  List<TimeSlotModel> timeSlotList;
  List<RuanganModel> ruanganList;
  Random random;
  AntModel(this.pengampuJadwalList, this.timeSlotList, this.ruanganList)
      : jadwal = AntJadwalModel(),
        random = Random();
  void constructSolution() {
    for (var pengampuJadwal in pengampuJadwalList) {
      try {
        var waktu = selectTimeSlotModel(pengampuJadwal);
        var ruangan = selectRuanganModel(pengampuJadwal, waktu);
        jadwal.assign(pengampuJadwal, waktu, ruangan);
      } catch (e, s) {
        // if (kDebugMode) {
        //   print('Exception details:\n $e');
        //   print('Stack trace:\n $s');
        // }
      }
    }
  }

  TimeSlotModel selectTimeSlotModel(PengampuJadwalModel pengampuJadwal) {
    var availableTimeSlotList = <TimeSlotModel>[];

    for (var timeSlot in timeSlotList) {
      if (timeSlot.hari.kelas.contains(pengampuJadwal.kelasType) &&
          !jadwal.isAssigned(pengampuJadwal, timeSlot)) {
        availableTimeSlotList.add(timeSlot);
      }
    }

    return availableTimeSlotList[random.nextInt(availableTimeSlotList.length)];
  }

  RuanganModel selectRuanganModel(
      PengampuJadwalModel pengampuJadwal, TimeSlotModel waktu) {
    var availableRuanganModelList = ruanganList
        .where((ruangan) => !jadwal.hasConflict(pengampuJadwal, waktu, ruangan))
        .toList();
    return availableRuanganModelList[
        random.nextInt(availableRuanganModelList.length)];
  }
}
