import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/data/repositories/app_update_repository_impl.dart';

import '../../mocks/mocks.dart';

void main() {
  test('skipUpdate delegates to local preferences storage', () async {
    final storage = MockPrefsLocalStorage();
    when(() => storage.skipUpdate()).thenAnswer((_) async {});
    final repository = AppUpdateRepositoryImpl(storage);

    await repository.skipUpdate();

    verify(() => storage.skipUpdate()).called(1);
  });
}
