import 'package:jadwal_kuliah/services/fakultas_service.dart';
import 'package:jadwal_kuliah/services/periode_semester_service.dart';
import 'package:stacked/stacked.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _fakultasService = locator<FakultasService>();
  final _periodSemesterService = locator<PeriodeSemesterService>();

  Future runStartupLogic() async {
    await _fakultasService.syncData();
    await _periodSemesterService.syncData();

    await _routerService.replaceWith(const DashboardViewRoute());
  }
}
