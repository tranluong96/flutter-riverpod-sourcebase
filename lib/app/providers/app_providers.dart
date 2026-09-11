import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/data/services/prefs_local_storage/app_prefs.dart';
import 'package:myapp/data/services/push_notification/provider/fcm_provider.dart';
import 'package:myapp/data/repositories/app_update_repository_impl.dart';
import 'package:myapp/data/repositories/auth_repository_impl.dart';
import 'package:myapp/domain/repositories/app_update_repository.dart';
import 'package:myapp/domain/repositories/auth_repository.dart';
import 'package:myapp/domain/use_cases/skip_update_use_case.dart';

final appUpdateRepositoryProvider = Provider<AppUpdateRepository>((ref) {
  return AppUpdateRepositoryImpl(ref.watch(appPrefsProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.watch(appPrefsProvider),
    ref.watch(fcmServiceProvider),
  );
});

final skipUpdateUseCaseProvider = Provider<SkipUpdateUseCase>((ref) {
  return SkipUpdateUseCase(ref.watch(appUpdateRepositoryProvider));
});
