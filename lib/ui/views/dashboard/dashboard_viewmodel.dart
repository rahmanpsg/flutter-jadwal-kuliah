import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/app/app.router.dart';
import 'package:jadwal_kuliah/models/dashboard_item_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unicons/unicons.dart';

class DashboardViewModel extends IndexTrackingViewModel {
  DashboardViewModel() {
    setCurrentWebPageIndex(_routerService);
  }

  final log = getLogger('DashboardViewModel');

  final _routerService = locator<RouterService>();

  final List<DashboardItemModel> items = [
    DashboardItemModel(
      icon: UniconsLine.apps,
      label: 'Home',
      route: const HomeViewRoute(),
    ),
    DashboardItemModel(
      icon: UniconsLine.book_alt,
      label: 'Matakuliah',
      route: const MatakuliahViewRoute(),
    ),
    DashboardItemModel(
      icon: UniconsLine.user_nurse,
      label: 'Dosen',
      route: const DosenViewRoute(),
    ),
    DashboardItemModel(
      icon: UniconsLine.graduation_cap,
      label: 'Program Studi',
      route: const ProgramStudiViewRoute(),
    ),
    DashboardItemModel(
      icon: UniconsLine.university,
      label: 'Fakultas',
      route: const FakultasViewRoute(),
    ),
    DashboardItemModel(
      icon: UniconsLine.building,
      label: 'Ruangan',
      route: const RuanganViewRoute(),
    ),
    DashboardItemModel(
      icon: UniconsLine.square_full,
      label: 'Kelas',
      route: const KelasViewRoute(),
    ),
    DashboardItemModel(
      icon: UniconsLine.sitemap,
      label: 'Pengampu',
      route: const PengampuViewRoute(),
    ),
    DashboardItemModel(
      icon: UniconsLine.setting,
      label: 'Pengaturan',
      route: const PengaturanViewRoute(),
    ),
  ];

  void handleNavigation(int idx) {
    if (currentIndex == idx) return;

    setIndex(idx);

    _routerService.navigateTo(items[idx].route);
  }
}
