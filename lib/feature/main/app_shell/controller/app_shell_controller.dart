import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/prefs/app_prefs.dart';
import 'package:myapp/feature/main/app_shell/state/app_shell_state.dart';
import 'package:myapp/feature/main/app_shell/state/vibration_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_shell_controller.g.dart';

@riverpod
class AppShellController extends Notifier<AppShellState> {
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
    final prefs = ref.read(appPrefsProvider);
    await prefs.skipUpdate();
    state = state.copyWith(doNotShowAgain: true);
  }
}

class VibrationNotifier extends Notifier<VibrationState> {
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
