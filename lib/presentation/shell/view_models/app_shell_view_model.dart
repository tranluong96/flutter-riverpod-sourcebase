import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/enums/enums.dart';
import 'package:myapp/app/providers/app_providers.dart';
import 'package:myapp/presentation/shell/view_models/app_shell_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibration/vibration.dart';

part 'app_shell_view_model.g.dart';

@riverpod
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
    await ref.read(skipUpdateUseCaseProvider)();
    state = state.copyWith(doNotShowAgain: true);
  }
}

class VibrationViewModel extends Notifier<VibrationStatus> {
  @override
  VibrationStatus build() {
    return VibrationStatus.idle;
  }

  Future<void> success() async {
    state = VibrationStatus.success;
    await Vibration.vibrate(pattern: [0, 300, 150, 300]);
    _reset();
  }

  void _reset() {
    state = VibrationStatus.idle;
  }
}
