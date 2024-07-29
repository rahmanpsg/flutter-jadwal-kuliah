// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/router_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/dosen_service.dart';
import '../services/fakultas_service.dart';
import '../services/hari_service.dart';
import '../services/jadwal_service.dart';
import '../services/jam_service.dart';
import '../services/kelas_service.dart';
import '../services/matakuliah_service.dart';
import '../services/pengampu_service.dart';
import '../services/periode_semester_service.dart';
import '../services/program_studi_service.dart';
import '../services/ruangan_service.dart';
import 'app.router.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
  StackedRouterWeb? stackedRouter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => RouterService());
  locator.registerLazySingleton(() => FakultasService());
  locator.registerLazySingleton(() => ProgramStudiService());
  locator.registerLazySingleton(() => DosenService());
  locator.registerLazySingleton(() => MatakuliahService());
  locator.registerLazySingleton(() => RuanganService());
  locator.registerLazySingleton(() => KelasService());
  locator.registerLazySingleton(() => PengampuService());
  locator.registerLazySingleton(() => PeriodeSemesterService());
  locator.registerLazySingleton(() => HariService());
  locator.registerLazySingleton(() => JamService());
  locator.registerLazySingleton(() => JadwalService());
  if (stackedRouter == null) {
    throw Exception(
        'Stacked is building to use the Router (Navigator 2.0) navigation but no stackedRouter is supplied. Pass the stackedRouter to the setupLocator function in main.dart');
  }

  locator<RouterService>().setRouter(stackedRouter);
}
