import 'package:jadwal_kuliah/models/hari_model.dart';
import 'package:jadwal_kuliah/models/jam_model.dart';

class TimeSlotModel {
  final HariModel hari;
  final JamModel jam;

  const TimeSlotModel({
    required this.hari,
    required this.jam,
  });

  /// generate time slot dari list hari dan jam
  static List<TimeSlotModel> generate(
    List<HariModel> hariList,
    List<JamModel> jamList,
  ) {
    final listTimeSlot = <TimeSlotModel>[];

    for (var hari in hariList) {
      for (var jam in jamList) {
        listTimeSlot.add(
          TimeSlotModel(
            hari: hari,
            jam: jam,
          ),
        );
      }
    }

    return listTimeSlot;
  }
}
