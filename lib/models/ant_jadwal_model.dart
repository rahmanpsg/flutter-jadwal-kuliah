import 'package:jadwal_kuliah/app/app.logger.dart';

import 'pengampu_jadwal_model.dart';
import 'ant_slot_model.dart';

class AntJadwalModel {
  final _logger = getLogger('AntJadwalModel');

  Map<PengampuJadwalModel, AntSlotModel> assignments;
  AntJadwalModel() : assignments = {};

  void assign(PengampuJadwalModel pengampuJadwal, AntSlotModel antSlot) {
    assignments[pengampuJadwal] = antSlot;
  }

  // cek conflict dosen
  bool hasDosenConflict(PengampuJadwalModel pengampuJadwal) {
    return false;
  }

  double calculateFitness() {
    double fitness = 0;

    for (var entry in assignments.entries) {
      var pengampuJadwal = entry.key;
      var antSlot = entry.value;

      // fitness += pengampuJadwal.jamList.length * antSlot.jamList.length;
      fitness += 1;
    }

    return fitness;
  }

  // buat fungsi untuk menghitung jarak
  // double calculateDistance(Ant other) {
  //   final jarakDHJ = sqrt(pow(dosen - other.dosen, 2) +
  //       pow(hari - other.hari, 2) +
  //       pow(jam - other.jam, 2));
  //   final jarakRHJ = sqrt(pow(ruang - other.ruang, 2) +
  //       pow(hari - other.hari, 2) +
  //       pow(jam - other.jam, 2));
  //   return sqrt(pow(jarakDHJ, 2) + pow(jarakRHJ, 2));
  // }
}
