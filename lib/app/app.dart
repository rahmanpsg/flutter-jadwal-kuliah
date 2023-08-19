import 'package:jadwal_kuliah/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:jadwal_kuliah/ui/views/home/home_view.dart';
import 'package:jadwal_kuliah/ui/views/startup/startup_view.dart';
import 'package:jadwal_kuliah/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:jadwal_kuliah/ui/views/dashboard/dashboard_view.dart';
import 'package:jadwal_kuliah/ui/views/matakuliah/matakuliah_view.dart';
import 'package:jadwal_kuliah/ui/views/program_studi/program_studi_view.dart';
import 'package:jadwal_kuliah/ui/views/dosen/dosen_view.dart';
import 'package:jadwal_kuliah/ui/views/fakultas/fakultas_view.dart';
import 'package:jadwal_kuliah/ui/views/ruangan/ruangan_view.dart';
import 'package:jadwal_kuliah/ui/views/kelas/kelas_view.dart';
import 'package:jadwal_kuliah/ui/views/pengampu/pengampu_view.dart';
import 'package:jadwal_kuliah/ui/views/pengaturan/pengaturan_view.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:jadwal_kuliah/services/fakultas_service.dart';
import 'package:jadwal_kuliah/services/program_studi_service.dart';
import 'package:jadwal_kuliah/services/dosen_service.dart';
import 'package:jadwal_kuliah/services/matakuliah_service.dart';
import 'package:jadwal_kuliah/services/ruangan_service.dart';
import 'package:jadwal_kuliah/services/kelas_service.dart';
import 'package:jadwal_kuliah/services/pengampu_service.dart';
import 'package:jadwal_kuliah/ui/dialogs/pengampu_form/pengampu_form_dialog.dart';
import 'package:jadwal_kuliah/services/hari_service.dart';
import 'package:jadwal_kuliah/services/jam_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: StartupView, initial: true),
    CustomRoute(page: DashboardView, children: [
      RedirectRoute(path: '', redirectTo: 'home'),
      CustomRoute(
        page: HomeView,
        initial: true,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        page: MatakuliahView,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        page: DosenView,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        page: ProgramStudiView,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        page: FakultasView,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        page: RuanganView,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        page: KelasView,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        page: PengampuView,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        page: PengaturanView,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
// @stacked-route
    ]),

    CustomRoute(page: UnknownView, path: '/404'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    LazySingleton(classType: FakultasService),
    LazySingleton(classType: ProgramStudiService),
    LazySingleton(classType: DosenService),
    LazySingleton(classType: MatakuliahService),
    LazySingleton(classType: RuanganService),
    LazySingleton(classType: KelasService),
    LazySingleton(classType: PengampuService),
    LazySingleton(classType: HariService),
    LazySingleton(classType: JamService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: FormDialog),
    StackedDialog(classType: PengampuFormDialog),
// @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}