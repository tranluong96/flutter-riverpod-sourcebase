import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/data/repositories/app_repository.dart';
import 'package:myapp/presentation/shell/view_models/app_shell_state.dart';
import 'package:myapp/presentation/shell/view_models/vibration_state.dart';

final appShellViewModelProvider =
    NotifierProvider<AppShellViewModel, AppShellState>(AppShellViewModel.new);

class AppShellViewModel extends Notifier<AppShellState> {
  @override
  AppShellState build() {
    return const AppShellState();
  }

  // ===============================
  // APP VERSION
  // ===============================

  Future<void> checkVersion() async {
    try {
      // final prefs = ref.read(appPrefsProvider);
      // final packageInfo = await PackageInfo.fromPlatform();
      // final currentVersion = packageInfo.version.split('-').first;
      // final platform = Platform.isAndroid ? 'android' : 'ios';

      // Do Something...
    } catch (_) {}
  }

  Future<void> skipUpdate() async {
    await ref.read(appRepositoryProvider).skipUpdate();
    state = state.copyWith(doNotShowAgain: true);
  }
}

class VibrationViewModel extends Notifier<VibrationState> {
  @override
  VibrationState build() {
    return VibrationState.idle;
  }

  Future<void> success() async {
    state = VibrationState.success;
    // Vibration.vibrate(pattern: [0, 300, 150, 300]);
    _reset();
  }

  void _reset() {
    state = VibrationState.idle;
  }
}
