import 'package:flutter_test/flutter_test.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('JamServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
