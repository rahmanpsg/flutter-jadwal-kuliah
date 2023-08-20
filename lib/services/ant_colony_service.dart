import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/ant_model.dart';
import 'package:jadwal_kuliah/models/ant_jadwal_model.dart';
import 'package:jadwal_kuliah/models/jadwal_model.dart';
import 'package:jadwal_kuliah/models/pengampu_jadwal_model.dart';
import 'package:jadwal_kuliah/models/ant_slot_model.dart';
import 'package:jadwal_kuliah/utils/datetime.dart';

class AntColonyService {
  final log = getLogger('AntColonyService');

  late List<AntModel> ants;
  List<PengampuJadwalModel> pengampuJadwalList;
  List<AntSlotModel> antSlotList;
  late List<List<double>> pheromoneMatrix;
  double alpha;
  double beta;
  double evaporationRate;
  int maxIterations;

  AntColonyService(
    this.pengampuJadwalList,
    this.antSlotList, {
    this.alpha = 1,
    this.beta = 1,
    this.evaporationRate = .5,
    this.maxIterations = 100,
  }) {
    ants = [];
    pheromoneMatrix = List.generate(
      pengampuJadwalList.length,
      (_) => List.filled(antSlotList.length, 1.0),
    );
  }
  void initializeAntModels() {
    ants = List.generate(
      pengampuJadwalList.length,
      (_) => AntModel(pengampuJadwalList, antSlotList),
    );
  }

  void updatePheromoneMatrix() {
    for (var i = 0; i < pengampuJadwalList.length; i++) {
      for (var j = 0; j < antSlotList.length; j++) {
        pheromoneMatrix[i][j] *= evaporationRate;
      }
    }
    for (var ant in ants) {
      var deltaPheromone = 1 / ant.jadwal.calculateFitness();

      for (var entry in ant.jadwal.assignments.entries) {
        var pengampuJadwal = entry.key;
        var antSlots = entry.value;

        for (var antSlot in antSlots) {
          var i = pengampuJadwalList.indexOf(pengampuJadwal);
          var j = antSlotList.indexOf(antSlot);

          pheromoneMatrix[i][j] += deltaPheromone;
        }
      }
    }
  }

  List<JadwalModel> runACO() {
    initializeAntModels();

    AntJadwalModel? bestSchedule;
    var bestFitness = double.infinity;

    for (var iteration = 0; iteration < maxIterations; iteration++) {
      for (var ant in ants) {
        // if (bestSchedule != ant.jadwal) {
        //   ant.jadwal.assignments.clear();
        // }
        ant.constructSolution(pheromoneMatrix);
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

    for (var entry in bestSchedule!.assignments.entries) {
      log.d('- ${entry.key.matakuliah.nama} ${entry.key.kelas.kelas}');
      for (var element in entry.value) {
        var jam =
            '${DateTimeUtils.timeOfDayToString(element.jam.mulai)} - ${DateTimeUtils.timeOfDayToString(element.jam.selesai)}';
        log.d('-- ${element.hari.hari} - $jam');
      }

      log.d("length: ${entry.value.length}");
    }

    return bestSchedule.assignments.entries.map((entry) {
      var pengampuJadwal = entry.key;

      // ambil ant slot yang paling sering muncul
      var mostAntSlot = bestSchedule!.getMostFrequentAntSlot(pengampuJadwal);

      var hari = mostAntSlot.hari;
      var jam = mostAntSlot.jam;
      var ruangan = mostAntSlot.ruangan;

      return JadwalModel(
        pengampuJadwal: pengampuJadwal,
        hari: hari,
        jam: jam,
        ruangan: ruangan,
      );
    }).toList();
  }
}
