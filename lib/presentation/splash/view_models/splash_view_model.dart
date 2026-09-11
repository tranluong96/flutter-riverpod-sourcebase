import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/data/repositories/session_repository.dart';

final splashViewModelProvider = Provider<SplashViewModel>((ref) {
  return SplashViewModel(ref.watch(sessionRepositoryProvider));
});

class SplashViewModel {
  const SplashViewModel(this._sessionRepository);

  final SessionRepository _sessionRepository;

  bool get hasSession => _sessionRepository.hasSession;
}
