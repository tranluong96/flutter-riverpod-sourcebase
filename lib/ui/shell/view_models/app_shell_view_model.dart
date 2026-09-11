import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/enums/enums.dart';
import 'package:myapp/ui/shell/view_models/app_shell_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibration/vibration.dart';

part 'app_shell_view_model.g.dart';

@riverpod
class AppShellViewModel extends Notifier<AppShellState> {
  @override
  AppShellState build() {
    return const AppShellState();
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
