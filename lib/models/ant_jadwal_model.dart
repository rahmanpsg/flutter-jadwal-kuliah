import 'pengampu_jadwal_model.dart';
import 'ruangan_model.dart';
import 'time_slot_model.dart';

class AntJadwalModel {
  Map<PengampuJadwalModel, Map<TimeSlotModel, RuanganModel>> assignments;
  AntJadwalModel() : assignments = {};
  void assign(PengampuJadwalModel pengampuJadwal, TimeSlotModel timeSlot,
      RuanganModel ruangan) {
    assignments[pengampuJadwal] ??= {};
    assignments[pengampuJadwal]?[timeSlot] = ruangan;
  }

  bool isAssigned(PengampuJadwalModel pengampuJadwal, TimeSlotModel timeSlot) {
    return assignments.containsKey(pengampuJadwal) &&
        (assignments[pengampuJadwal]?.containsKey(timeSlot) ?? false);
  }

  bool hasConflict(PengampuJadwalModel pengampuJadwal, TimeSlotModel timeSlot,
      RuanganModel ruangan) {
    if (isAssigned(pengampuJadwal, timeSlot)) {
      return true;
    }
    for (var entry in assignments.entries) {
      var assignedPengampuJadwalModel = entry.key;
      var assignedTimeslots = entry.value.keys;
      if (assignedTimeslots.contains(timeSlot) &&
          assignments[assignedPengampuJadwalModel]?[timeSlot] == ruangan) {
        return true;
      }
    }
    return false;
  }

  double calculateFitness() {
    double fitness = 0;
    for (var entry in assignments.entries) {
      // var pengampuJadwal = entry.key;
      var timeslots = entry.value.keys.toSet();
      var uniqueTimeslots = timeslots.length;
      fitness += uniqueTimeslots.toDouble();
    }
    return fitness;
  }

  @override
  String toString() {
    String result = '';
    for (var entry in assignments.entries) {
      var pengampuJadwal = entry.key;
      var timeslots = entry.value.keys.toSet();
      var uniqueTimeslots = timeslots.length;
      result +=
          '${pengampuJadwal.matakuliah.nama} - ${pengampuJadwal.dosen.nama} - ${pengampuJadwal.kelas.kelas} - $uniqueTimeslots\n';
    }
    return result;
  }
}
