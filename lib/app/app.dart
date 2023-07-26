import 'package:jadwal_kuliah/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:jadwal_kuliah/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:jadwal_kuliah/ui/views/home/home_view.dart';
import 'package:jadwal_kuliah/ui/views/startup/startup_view.dart';
import 'package:jadwal_kuliah/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:jadwal_kuliah/ui/views/dashboard/dashboard_view.dart';
import 'package:jadwal_kuliah/ui/views/matakuliah/matakuliah_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: StartupView, initial: true),
    CustomRoute(page: DashboardView, maintainState: true, children: [
      RedirectRoute(path: '', redirectTo: 'home'),
      CustomRoute(page: HomeView, initial: true),
      CustomRoute(page: MatakuliahView),
    ]),
// @stacked-route

    CustomRoute(page: UnknownView, path: '/404'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
