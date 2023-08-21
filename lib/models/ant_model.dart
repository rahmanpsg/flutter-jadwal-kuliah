import 'dart:math';

import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/pengampu_jadwal_model.dart';
import 'package:jadwal_kuliah/models/ruangan_model.dart';
import 'package:uuid/uuid.dart';

import 'ant_slot_model.dart';
import 'hari_model.dart';
import 'jam_model.dart';

class AntModel {
  final String id = const Uuid().v4();

  PengampuJadwalModel pengampuJadwal;
  AntSlotModel? _antSlot;

  AntSlotModel? get antSlot => _antSlot;

  int titikDosen;
  int titikMatakuliah;
  int titikKelas;

  late int _titikRuang;
  late int _titikHari;
  late int _titikJam;

  /// jarak antara ant dengan ant lain
  final List<double> jarakAntaraAnts = [];

  /// visibilitas ant dengan ant lain
  final List<double> visibilitasAntaraAnts = [];

  double jarakTotal = 0.0;

  /// jumlah bentrok ant dengan ant lain
  double bentrok = 0.0;

  Random random;

  AntModel(
    this.pengampuJadwal, {
    required int totalAnt,
    required this.titikDosen,
    required this.titikMatakuliah,
    required this.titikKelas,
  }) : random = Random() {
    for (var i = 0; i < totalAnt; i++) {
      jarakAntaraAnts.add(0.0);
      visibilitasAntaraAnts.add(0.0);
    }
  }

  final _logger = getLogger('AntModel');

  void setAntSlot(AntSlotModel antSlot) {
    _antSlot = antSlot;
  }

  void setTitik({
    required Set<RuanganModel> ruanganSet,
    required Set<HariModel> hariSet,
    required Set<JamModel> jamSet,
  }) {
    _titikRuang = ruanganSet.toList().indexOf(_antSlot!.ruangan);
    _titikHari = hariSet.toList().indexOf(_antSlot!.hari);
    _titikJam = jamSet.toList().indexOf(_antSlot!.jam);
  }

  void printTitik() {
    _logger.d('titikDosen: $titikDosen');
    _logger.d('titikMatakuliah: $titikMatakuliah');
    _logger.d('titikKelas: $titikKelas');
    _logger.d('titikRuangan: $_titikRuang');
    _logger.d('titikHari: $_titikHari');
    _logger.d('titikJam: $_titikJam');
  }

  void hitungJarakAntaraAnts(List<AntModel> ants) {
    try {
      for (var i = 0; i < ants.length; i++) {
        final ant = ants[i];

        if (ant.id == id) {
          continue;
        }

        final jarakDosen = titikDosen - ant.titikDosen.toDouble();
        final jarakRuang = _titikRuang - ant._titikRuang.toDouble();
        final jarakHari = _titikHari - ant._titikHari.toDouble();
        final jarakJam = _titikJam - ant._titikJam.toDouble();

        final jarakDHJ =
            sqrt(pow(jarakDosen, 2) + pow(jarakHari, 2) + pow(jarakJam, 2));
        final jarakRHJ =
            sqrt(pow(jarakRuang, 2) + pow(jarakHari, 2) + pow(jarakJam, 2));

        jarakTotal = sqrt(pow(jarakDHJ, 2) + pow(jarakRHJ, 2));

        jarakAntaraAnts[i] = jarakTotal;

        visibilitasAntaraAnts[i] = _calculateVisibility(jarakTotal);
      }
    } catch (e) {
      _logger.e(e);
    }
  }

  double _calculateVisibility(double distance) {
    return 1 / distance;
  }

  double calculateProbability(
      double visibility, double totalVisibility, double alpha, double beta) {
    return pow(visibility, alpha) * pow(totalVisibility, beta).toDouble();
  }

  void hitungBentrok(List<AntModel> ants) {
    for (var i = 0; i < ants.length; i++) {
      final ant = ants[i];

      if (ant.id == id) {
        continue;
      }

      if (_antSlot!.hari == ant._antSlot!.hari &&
          _antSlot!.jam == ant._antSlot!.jam) {
        if (_antSlot!.ruangan == ant._antSlot!.ruangan) {
          bentrok++;
        }

        if (pengampuJadwal.dosen == ant.pengampuJadwal.dosen) {
          bentrok++;
        }
      }
    }
  }
}
