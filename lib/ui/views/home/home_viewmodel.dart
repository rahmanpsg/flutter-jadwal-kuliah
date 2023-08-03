import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/services/fakultas_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');

  final _fakultasService = locator<FakultasService>();
  final _programStudiService = locator<FakultasService>();

  int get totalFakultas => _fakultasService.items.length;
  int get totalProgramStudi => _programStudiService.items.length;

  void init() async {
    setBusy(true);

    await _fakultasService.syncData();
    await _programStudiService.syncData();

    setBusy(false);
  }
}
