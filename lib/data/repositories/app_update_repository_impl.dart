import 'package:myapp/data/services/prefs_local_storage/app_prefs.dart';
import 'package:myapp/domain/repositories/app_update_repository.dart';

class AppUpdateRepositoryImpl implements AppUpdateRepository {
  const AppUpdateRepositoryImpl(this._appPrefs);

  final PrefsLocalStorage _appPrefs;

  @override
  Future<void> skipUpdate() => _appPrefs.skipUpdate();
}
