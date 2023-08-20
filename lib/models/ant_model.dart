import 'dart:math';

import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/pengampu_jadwal_model.dart';

import 'ant_jadwal_model.dart';
import 'ant_slot_model.dart';

class AntModel {
  final _logger = getLogger('AntModel');

  AntJadwalModel jadwal;
  List<PengampuJadwalModel> pengampuJadwalList;
  List<AntSlotModel> antSlotList;
  Random random;
  AntModel(this.pengampuJadwalList, this.antSlotList)
      : jadwal = AntJadwalModel(),
        random = Random();

  void constructSolution(List<List<double>> pheromoneMatrix) {
    for (var pengampuJadwal in pengampuJadwalList) {
      try {
        var antSlot = selectAntSlotModel(pengampuJadwal, pheromoneMatrix);
        jadwal.assign(pengampuJadwal, antSlot);
      } catch (e, s) {
        _logger.e('Error constructSolution', e, s);
      }
    }
  }

  AntSlotModel selectAntSlotModel(
      PengampuJadwalModel pengampuJadwal, List<List<double>> pheromoneMatrix) {
    var availableAntSlotList = <AntSlotModel>[];

    for (var antSlot in antSlotList) {
      if (jadwal.hasConflict(pengampuJadwal, antSlot)) {
        continue;
      }

      if (jadwal.hasDosenConflict(pengampuJadwal)) {
        continue;
      }

      if (!antSlot.hari.kelas.contains(pengampuJadwal.kelasType)) {
        continue;
      }

      availableAntSlotList.add(antSlot);
    }

    if (availableAntSlotList.isEmpty) {
      // throw 'Tidak ada slot yang tersedia';
      availableAntSlotList = antSlotList;
    }

    var alpha = 2;
    var beta = 1;

    var total = 0.0;
    var probabilities = <double>[];

    for (var antSlot in availableAntSlotList) {
      var i = pengampuJadwalList.indexOf(pengampuJadwal);
      var j = antSlotList.indexOf(antSlot);

      var pheromone = pheromoneMatrix[i][j];
      var heuristic = 1 / antSlot.hari.kelas.length;

      var probability = pow(pheromone, alpha) * pow(heuristic, beta);

      total += probability;
      probabilities.add(probability.toDouble());
    }

    var randomValue = random.nextDouble() * total;

    var cumulative = 0.0;

    for (var i = 0; i < availableAntSlotList.length; i++) {
      cumulative += probabilities[i];

      if (cumulative >= randomValue) {
        return availableAntSlotList[i];
      }
    }

    throw 'Tidak ada slot yang tersedia';
  }
}
