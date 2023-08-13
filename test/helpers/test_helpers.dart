import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:jadwal_kuliah/services/fakultas_service.dart';
import 'package:jadwal_kuliah/services/program_studi_service.dart';
import 'package:jadwal_kuliah/services/dosen_service.dart';
import 'package:jadwal_kuliah/services/matakuliah_service.dart';
import 'package:jadwal_kuliah/services/ruangan_service.dart';
import 'package:jadwal_kuliah/services/kelas_service.dart';
import 'package:jadwal_kuliah/services/pengampu_service.dart';
import 'package:jadwal_kuliah/services/hari_service.dart';
import 'package:jadwal_kuliah/services/jam_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<RouterService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FakultasService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ProgramStudiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DosenService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<MatakuliahService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<RuanganService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<KelasService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PengampuService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<HariService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<JamService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterRouterService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterFakultasService();
  getAndRegisterProgramStudiService();
  getAndRegisterDosenService();
  getAndRegisterMatakuliahService();
  getAndRegisterRuanganService();
  getAndRegisterKelasService();
  getAndRegisterPengampuService();
  getAndRegisterHariService();
  getAndRegisterJamService();
// @stacked-mock-register
}

MockRouterService getAndRegisterRouterService() {
  _removeRegistrationIfExists<RouterService>();
  final service = MockRouterService();
  locator.registerSingleton<RouterService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockFakultasService getAndRegisterFakultasService() {
  _removeRegistrationIfExists<FakultasService>();
  final service = MockFakultasService();
  locator.registerSingleton<FakultasService>(service);
  return service;
}

MockProgramStudiService getAndRegisterProgramStudiService() {
  _removeRegistrationIfExists<ProgramStudiService>();
  final service = MockProgramStudiService();
  locator.registerSingleton<ProgramStudiService>(service);
  return service;
}

MockDosenService getAndRegisterDosenService() {
  _removeRegistrationIfExists<DosenService>();
  final service = MockDosenService();
  locator.registerSingleton<DosenService>(service);
  return service;
}

MockMatakuliahService getAndRegisterMatakuliahService() {
  _removeRegistrationIfExists<MatakuliahService>();
  final service = MockMatakuliahService();
  locator.registerSingleton<MatakuliahService>(service);
  return service;
}

MockRuanganService getAndRegisterRuanganService() {
  _removeRegistrationIfExists<RuanganService>();
  final service = MockRuanganService();
  locator.registerSingleton<RuanganService>(service);
  return service;
}

MockKelasService getAndRegisterKelasService() {
  _removeRegistrationIfExists<KelasService>();
  final service = MockKelasService();
  locator.registerSingleton<KelasService>(service);
  return service;
}

MockPengampuService getAndRegisterPengampuService() {
  _removeRegistrationIfExists<PengampuService>();
  final service = MockPengampuService();
  locator.registerSingleton<PengampuService>(service);
  return service;
}

MockHariService getAndRegisterHariService() {
  _removeRegistrationIfExists<HariService>();
  final service = MockHariService();
  locator.registerSingleton<HariService>(service);
  return service;
}

MockJamService getAndRegisterJamService() {
  _removeRegistrationIfExists<JamService>();
  final service = MockJamService();
  locator.registerSingleton<JamService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
