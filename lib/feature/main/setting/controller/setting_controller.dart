import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/feature/main/setting/state/setting_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "setting_controller.g.dart";

@riverpod
class SettingController extends Notifier<SettingState> {
  bool _isDisposed = false;

  @override
  SettingState build() {
    ref.onDispose(() {
      _isDisposed = true;
    });
    return const SettingState();
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);
    try {
      // final deviceToken = ref.read(fcmControllerProvider).deviceToken ?? '';
    } catch (_) {
      // Ignore API error — still proceed with local logout
    }
    try {
      if (_isDisposed) return;
    } catch (e) {
      if (_isDisposed) return;
      state = state.copyWith(isLoading: false);
      return;
    }
    state = state.copyWith(isLoading: false);
  }

  void reset() {
    state = const SettingState();
  }
}
