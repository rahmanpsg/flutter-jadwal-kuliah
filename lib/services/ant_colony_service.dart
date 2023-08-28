import 'dart:isolate';
import 'dart:math';

import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/ant_model.dart';
import 'package:jadwal_kuliah/models/dosen_model.dart';
import 'package:jadwal_kuliah/models/hari_model.dart';
import 'package:jadwal_kuliah/models/jadwal_model.dart';
import 'package:jadwal_kuliah/models/jam_model.dart';
import 'package:jadwal_kuliah/models/matakuliah_model.dart';
import 'package:jadwal_kuliah/models/pengampu_jadwal_model.dart';
import 'package:jadwal_kuliah/models/ant_slot_model.dart';
import 'package:jadwal_kuliah/models/pengampu_model.dart';
import 'package:jadwal_kuliah/models/ruangan_model.dart';

class AntColonyService {
  final log = getLogger('AntColonyService');

  List<PengampuJadwalModel> pengampuJadwalList;
  List<AntSlotModel> antSlotList;
  late List<AntModel> ants;
  late List<List<double>> pheromoneMatrix;
  double alpha;
  double beta;
  double evaporationRate;
  int maxIterations;

  final Set<DosenModel> _dosenSet = {};
  final Set<MatakuliahModel> _matakuliahSet = {};
  final Set<PengampuKelasModel> _kelasSet = {};
  final Set<RuanganModel> _ruanganSet = {};
  final Set<HariModel> _hariSet = {};
  final Set<JamModel> _jamSet = {};

  Random random;

  AntColonyService(
    this.pengampuJadwalList,
    this.antSlotList, {
    this.alpha = 1,
    this.beta = 1,
    this.evaporationRate = .5,
    this.maxIterations = 100,
  }) : random = Random() {
    ants = [];
    pheromoneMatrix = List.generate(
      pengampuJadwalList.length,
      (_) => List.filled(antSlotList.length, 1.0),
    );
  }
  void initializeAnt() {
    for (var pengampuJadwal in pengampuJadwalList) {
      _dosenSet.add(pengampuJadwal.dosen);
      _matakuliahSet.add(pengampuJadwal.matakuliah);
      _kelasSet.add(pengampuJadwal.kelas);
    }

    ants = List.generate(
      pengampuJadwalList.length,
      (index) {
        final pengampuJadwal = pengampuJadwalList.elementAt(index);

        return AntModel(
          pengampuJadwal,
          totalAnt: pengampuJadwalList.length,
          titikDosen: _dosenSet.toList().indexOf(pengampuJadwal.dosen),
          titikMatakuliah:
              _matakuliahSet.toList().indexOf(pengampuJadwal.matakuliah),
          titikKelas: _kelasSet.toList().indexOf(pengampuJadwal.kelas),
        );
      },
    );

    for (var antSlot in antSlotList) {
      _ruanganSet.add(antSlot.ruangan);
      _hariSet.add(antSlot.hari);
      _jamSet.add(antSlot.jam);
    }
  }

  void updatePheromoneMatrix() {
    for (var i = 0; i < pengampuJadwalList.length; i++) {
      for (var j = 0; j < antSlotList.length; j++) {
        pheromoneMatrix[i][j] *= evaporationRate;
      }
    }
    // for (var ant in ants) {
    //   var deltaPheromone = 1 / ant.jadwal.calculateFitness();

    //   for (var entry in ant.jadwal.assignments.entries) {
    //     var pengampuJadwal = entry.key;
    //     var antSlot = entry.value;

    //     var i = pengampuJadwalList.indexOf(pengampuJadwal);
    //     var j = antSlotList.indexOf(antSlot);

    //     pheromoneMatrix[i][j] += deltaPheromone;
    //   }
    // }
  }

  // Future<List<JadwalModel>> runACO() async {
  void runACO(SendPort sendPort) {
    initializeAnt();

    List<AntModel>? bestSchedule;
    var bestFitness = double.infinity;

    for (var iteration = 0; iteration < maxIterations; iteration++) {
      if (bestSchedule != null) {
        ants = List.from(bestSchedule);
      }

      for (var ant in ants) {
        final antSlot = selectAntSlot(ant);

        ant.setAntSlot(antSlot);
        // ant.setTitik(
        //   ruanganSet: _ruanganSet,
        //   hariSet: _hariSet,
        //   jamSet: _jamSet,
        // );
      }

      for (var ant in ants) {
        // ant.hitungJarakAntaraAnts(ants);
        ant.hitungBentrok(ants, antSlotList);
      }

      var fitness = calculateFitness();
      if (fitness < bestFitness) {
        bestFitness = fitness;
        bestSchedule = List.from(ants);
      }

      // updatePheromoneMatrix();

      sendPort.send(
          "Iterasi: ${iteration + 1} || Best Fitness: $bestFitness || Fitness: $fitness ");

      if (fitness == 0) break;
    }

    log.d("Best Fitness: $bestFitness");

    bestSchedule!.sort((a, b) => antSlotList.indexOf(a.antSlot!).compareTo(
          antSlotList.indexOf(b.antSlot!),
        ));

    final jadwalList = bestSchedule.map((ant) {
      var pengampuJadwal = ant.pengampuJadwal;
      var antSlot = ant.antSlot!;

      var hari = antSlot.hari;
      var ruangan = antSlot.ruangan;

      var startJamIndex = antSlotList.indexOf(antSlot);

      var jam = <JamModel>[];

      var jamIndex = startJamIndex + jam.length;

      while (jam.length < pengampuJadwal.matakuliah.sks) {
        if (jamIndex >= antSlotList.length) {
          // throw 'Tidak ada slot yang tersedia';
          break;
        }

        var antSlot = antSlotList[jamIndex];

        // if (antSlot.hari != hari || antSlot.ruangan != ruangan) {
        //   throw 'Tidak ada slot yang tersedia';
        // }

        // cek jika jam sudah ada di list jam
        if (jam.contains(antSlot.jam)) {
          // lanjut ke slot berikutnya
          jamIndex++;
          continue;
        }

        jam.add(antSlot.jam);

        jamIndex++;
      }

      return JadwalModel(
        pengampuJadwal: pengampuJadwal,
        hari: hari,
        jam: jam,
        ruangan: ruangan,
      );
    }).toList();

    sendPort.send(jadwalList);
  }

  AntSlotModel selectAntSlot(AntModel ant) {
    final pengampuJadwal = ant.pengampuJadwal;

    if (ant.bentrok == 0 && ant.antSlot != null) {
      if (random.nextBool()) return ant.antSlot!;
    }

    var availableAntSlotList = <AntSlotModel>[];

    for (var antSlot in antSlotList) {
      if (antSlot == ant.antSlot) continue;

      if (!antSlot.hari.kelas.contains(pengampuJadwal.kelasType)) {
        continue;
      }

      // cek jika kemungkinan jam selesai melebihi jam selesai hari
      var indexOfJam = _jamSet.toList().indexOf(antSlot.jam);

      if (indexOfJam + pengampuJadwal.matakuliah.sks > _jamSet.length) {
        continue;
      }

      availableAntSlotList.add(antSlot);
    }

    if (availableAntSlotList.isEmpty) {
      throw 'Tidak ada slot yang tersedia';
    }

    return availableAntSlotList[random.nextInt(availableAntSlotList.length)];
  }

  // calculate fitness
  double calculateFitness() {
    double fitness = 0;

    // cek bentrok
    for (var i = 0; i < ants.length; i++) {
      var ant = ants[i];
      var pengampuJadwal = ant.pengampuJadwal;
      var startAntSlotIndex = antSlotList.indexOf(ant.antSlot!);

      if (startAntSlotIndex == -1) {
        continue;
      }

      for (var j = i + 1; j < ants.length; j++) {
        var otherAnt = ants[j];
        var otherPengampuJadwal = otherAnt.pengampuJadwal;
        var otherAntSlot = otherAnt.antSlot;

        for (var i = 0; i < pengampuJadwal.matakuliah.sks; i++) {
          var antSlotIndex = startAntSlotIndex + i;

          if (antSlotIndex >= antSlotList.length) {
            break;
          }

          var antSlot = antSlotList[antSlotIndex];

          if (otherAntSlot == null) {
            continue;
          }

          if (antSlot == otherAntSlot) {
            fitness += 1;
          }

          if (antSlot.hari.id == otherAntSlot.hari.id &&
              antSlot.jam.id == otherAntSlot.jam.id) {
            if (antSlot.ruangan.id == otherAntSlot.ruangan.id &&
                antSlot.jam.id == otherAntSlot.jam.id) {
              fitness += 1;
            }

            if (pengampuJadwal.dosen.id == otherPengampuJadwal.dosen.id &&
                antSlot.jam.id == otherAntSlot.jam.id) {
              fitness += 1;
            }

            if (pengampuJadwal.kelas.id == otherPengampuJadwal.kelas.id &&
                antSlot.jam.id == otherAntSlot.jam.id) {
              fitness += 1;
            }
          }
        }
      }
    }

    return fitness;
  }
}
