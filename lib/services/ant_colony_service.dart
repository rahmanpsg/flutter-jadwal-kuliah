import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/ant_model.dart';
import 'package:jadwal_kuliah/models/ant_jadwal_model.dart';
import 'package:jadwal_kuliah/models/jadwal_model.dart';
import 'package:jadwal_kuliah/models/pengampu_jadwal_model.dart';
import 'package:jadwal_kuliah/models/ruangan_model.dart';
import 'package:jadwal_kuliah/models/time_slot_model.dart';
import 'package:jadwal_kuliah/utils/datetime.dart';

class AntColonyService {
  final log = getLogger('AntColonyService');

  late List<AntModel> ants;
  List<PengampuJadwalModel> pengampuJadwalList;
  List<TimeSlotModel> timeSlotList;
  List<RuanganModel> ruanganList;
  late List<List<double>> pheromoneMatrix;
  double evaporationRate;
  double alpha;
  double beta;
  int maxIterations;

  AntColonyService(
    this.pengampuJadwalList,
    this.timeSlotList,
    this.ruanganList, {
    this.evaporationRate = 0.5,
    this.alpha = 1,
    this.beta = 1,
    this.maxIterations = 100,
  }) {
    ants = [];
    pheromoneMatrix = List.generate(
      timeSlotList.length,
      (_) => List.generate(ruanganList.length, (_) => 1.0),
    );
  }
  void initializeAntModels() {
    ants = List.generate(
      pengampuJadwalList.length,
      (_) => AntModel(pengampuJadwalList, timeSlotList, ruanganList),
    );
  }

  void updatePheromoneMatrix() {
    for (var i = 0; i < timeSlotList.length; i++) {
      for (var j = 0; j < ruanganList.length; j++) {
        pheromoneMatrix[i][j] *= evaporationRate;
      }
    }
    for (var ant in ants) {
      var deltaPheromone = 1 / ant.jadwal.calculateFitness();
      for (var entry in ant.jadwal.assignments.entries) {
        var timeslots = entry.value.keys;
        for (var timeslot in timeslots) {
          var ruangan = entry.value[timeslot];
          if (ruangan == null) continue;
          var i = timeSlotList.indexOf(timeslot);
          var j = ruanganList.indexOf(ruangan);
          pheromoneMatrix[i][j] += deltaPheromone;
        }
      }
    }
  }

  List<JadwalModel> runACO() {
    initializeAntModels();
    var bestSchedule = AntJadwalModel();
    var bestFitness = double.infinity;
    for (var iteration = 0; iteration < maxIterations; iteration++) {
      for (var ant in ants) {
        ant.constructSolution();
      }
      for (var ant in ants) {
        var fitness = ant.jadwal.calculateFitness();
        if (fitness < bestFitness) {
          bestFitness = fitness;
          bestSchedule = ant.jadwal;
        }
      }
      updatePheromoneMatrix();

      log.d("Iteration: ${iteration + 1} || Best Fitness: $bestFitness");
    }
    // return bestSchedule;

    for (var entry in bestSchedule.assignments.entries) {
      log.d('- ${entry.key.matakuliah.nama} ${entry.key.kelas.kelas}');
      for (var element in entry.value.keys) {
        var jam =
            '${DateTimeUtils.timeOfDayToString(element.jam.mulai)} - ${DateTimeUtils.timeOfDayToString(element.jam.selesai)}';
        log.d('-- ${element.hari.hari} - $jam');
      }

      log.d("length: ${entry.value.keys.length}");
    }

    return bestSchedule.assignments.entries.map((entry) {
      var pengampuJadwal = entry.key;
      var timeslots = entry.value.keys.toSet();
      var uniqueTimeslots = timeslots.length;
      var hari = timeslots.first.hari;
      var jam = timeslots.first.jam;
      var ruangan = entry.value[timeslots.first];
      return JadwalModel(
        pengampuJadwal: pengampuJadwal,
        hari: hari,
        jam: jam,
        ruangan: ruangan!,
      );
    }).toList();
  }
}
