import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unicons/unicons.dart';

class DashboardViewModel extends IndexTrackingViewModel {
  final log = getLogger('DashboardViewModel');

  final _routerService = locator<RouterService>();

  final navigatorKey = StackedService.nestedNavigationKey(1);

  final List<Map<String, dynamic>> items = [
    {
      'icon': UniconsLine.apps,
      'label': 'Home',
      'route': const HomeViewRoute(),
    },
    {
      'icon': UniconsLine.book_alt,
      'label': 'Matakuliah',
      'route': const MatakuliahViewRoute(),
    },
    {
      'icon': UniconsLine.user_nurse,
      'label': 'Dosen',
    },
    {
      'icon': UniconsLine.graduation_cap,
      'label': 'Program Studi',
    },
    {
      'icon': UniconsLine.university,
      'label': 'Fakultas',
    },
    {
      'icon': UniconsLine.table,
      'label': 'Ruangan',
    },
    {
      'icon': UniconsLine.square_full,
      'label': 'Kelas',
    },
    {
      'icon': UniconsLine.sitemap,
      'label': 'Pengampu',
    },
    {
      'icon': UniconsLine.play,
      'label': 'Buat Jadwal',
    },
    {
      'icon': UniconsLine.setting,
      'label': 'Pengaturan',
    },
    // {
    //   'icon': UniconsLine.book_reader,
    //   'label': 'Deteksi',
    // },
  ];

  DashboardViewModel() {
    setCurrentWebPageIndex(_routerService);
  }

  void handleNavigation(int idx) {
    if (currentIndex == idx) return;

    setIndex(idx);

    _routerService.navigateTo(items[idx]['route']);
  }
}
