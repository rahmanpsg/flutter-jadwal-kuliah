import 'package:equatable/equatable.dart';
import 'package:jadwal_kuliah/models/hari_model.dart';
import 'package:jadwal_kuliah/models/jam_model.dart';
import 'package:jadwal_kuliah/models/ruangan_model.dart';
import 'package:uuid/uuid.dart';

class AntSlotModel extends Equatable {
  final String id;
  final HariModel hari;
  final JamModel jam;
  final RuanganModel ruangan;

  AntSlotModel({
    String? id,
    required this.hari,
    required this.jam,
    required this.ruangan,
  }) : id = id ?? const Uuid().v4();

  /// generate ant slot dari list hari, jam dan ruangan
  static List<AntSlotModel> generate(
    List<HariModel> hariList,
    List<JamModel> jamList,
    List<RuanganModel> ruanganList,
  ) {
    final antSlotList = <AntSlotModel>[];

    for (var hari in hariList) {
      for (var jam in jamList) {
        for (var ruangan in ruanganList) {
          antSlotList.add(AntSlotModel(hari: hari, jam: jam, ruangan: ruangan));
        }
      }
    }

    return antSlotList;
  }

  @override
  List<Object?> get props => [id];
}
