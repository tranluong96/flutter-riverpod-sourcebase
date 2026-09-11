import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/data/repositories/auth_repository_impl.dart';

import '../../mocks/mocks.dart';

void main() {
  test('logout clears the session and cancels local notifications', () async {
    final prefs = MockPrefsLocalStorage();
    final fcm = MockFCMService();
    when(() => prefs.clearSession()).thenAnswer((_) async {});
    when(() => fcm.cancelAllNotifications()).thenAnswer((_) async {});
    final repository = AuthRepositoryImpl(prefs, fcm);

    await repository.logout();

    verify(() => prefs.clearSession()).called(1);
    verify(() => fcm.cancelAllNotifications()).called(1);
  });
}
