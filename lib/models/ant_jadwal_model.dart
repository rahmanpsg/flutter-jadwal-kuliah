import 'package:jadwal_kuliah/app/app.logger.dart';

import 'pengampu_jadwal_model.dart';
import 'ant_slot_model.dart';

class AntJadwalModel {
  final _logger = getLogger('AntJadwalModel');

  Map<PengampuJadwalModel, List<AntSlotModel>> assignments;
  AntJadwalModel() : assignments = {};
  void assign(PengampuJadwalModel pengampuJadwal, AntSlotModel antSlot) {
    assignments[pengampuJadwal] ??= [];
    assignments[pengampuJadwal]?.add(antSlot);
  }

  bool isAssigned(PengampuJadwalModel pengampuJadwal, AntSlotModel antSlot) {
    return assignments[pengampuJadwal]?.contains(antSlot) ?? false;
  }

  bool hasConflict(PengampuJadwalModel pengampuJadwal, AntSlotModel antSlot) {
    if (isAssigned(pengampuJadwal, antSlot)) {
      return true;
    }
    for (var entry in assignments.entries) {
      var assignedAntSlots = entry.value;

      if (assignedAntSlots.contains(antSlot)) {
        return true;
      }
    }
    return false;
  }

  // cek conflict dosen
  bool hasDosenConflict(PengampuJadwalModel pengampuJadwal) {
    for (var entry in assignments.entries) {
      var assignedAntSlots = entry.value;
      var assignedPengampuJadwal = entry.key;

      if (pengampuJadwal.id == assignedPengampuJadwal.id) {
        continue;
      }

      if (assignedPengampuJadwal.dosen.id == pengampuJadwal.dosen.id) {
        final mostAntSlot = getMostFrequentAntSlot(assignedPengampuJadwal);

        if (assignedAntSlots.contains(mostAntSlot)) {
          // _logger.w("dosen conflict: ${pengampuJadwal.dosen.nama}");
          return true;
        }
      }
    }
    return false;
  }

  /// ambil ant slot dari pengampu jadwal yang paling sering muncul
  AntSlotModel getMostFrequentAntSlot(PengampuJadwalModel pengampuJadwal) {
    var antSlots = assignments[pengampuJadwal];
    var antSlot = antSlots?.reduce((value, element) {
      var countValue = antSlots.where((e) => e == value).length;
      var countElement = antSlots.where((e) => e == element).length;
      return countValue > countElement ? value : element;
    });
    return antSlot!;
  }

  double calculateFitness() {
    double fitness = 0;
    for (var entry in assignments.entries) {
      var timeslots = entry.value.toSet();
      var uniqueTimeslots = timeslots.length;
      fitness += uniqueTimeslots.toDouble();

      // cek dosen conflict
      if (hasDosenConflict(entry.key)) {
        fitness += .1;
      }
    }
    return fitness;
  }

  @override
  String toString() {
    String result = '';
    for (var entry in assignments.entries) {
      var pengampuJadwal = entry.key;
      var timeslots = entry.value.toSet();
      var uniqueTimeslots = timeslots.length;
      result +=
          '${pengampuJadwal.matakuliah.nama} - ${pengampuJadwal.dosen.nama} - ${pengampuJadwal.kelas.kelas} - $uniqueTimeslots\n';
    }
    return result;
  }
}
