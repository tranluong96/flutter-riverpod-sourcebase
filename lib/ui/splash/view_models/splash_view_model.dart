import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/data/repositories_impl/auth/auth_repository_impl.dart';
import 'package:myapp/domain/repositories/auth/auth_repository.dart';

final splashViewModelProvider = Provider<SplashViewModel>((ref) {
  return SplashViewModel(ref.watch(authRepositoryProvider));
});

class SplashViewModel {
  const SplashViewModel(this._sessionRepository);

  final AuthRepository _sessionRepository;

  bool get hasSession => _sessionRepository.hasSession;
}
