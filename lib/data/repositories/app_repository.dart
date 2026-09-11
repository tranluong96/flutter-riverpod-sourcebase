import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/prefs/app_prefs.dart';

final appRepositoryProvider = Provider<AppRepository>((ref) {
  return AppRepository(ref.watch(appPrefsProvider));
});

class AppRepository {
  const AppRepository(this._appPrefs);

  final AppPrefs _appPrefs;

  Future<void> skipUpdate() => _appPrefs.skipUpdate();
}
