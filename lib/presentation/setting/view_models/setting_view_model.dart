import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/providers/app_providers.dart';
import 'package:myapp/presentation/setting/view_models/setting_state.dart';

final settingViewModelProvider =
    NotifierProvider<SettingViewModel, SettingState>(SettingViewModel.new);

class SettingViewModel extends Notifier<SettingState> {
  @override
  SettingState build() {
    return const SettingState();
  }

  Future<bool> logout() async {
    state = state.copyWith(isLoading: true);
    try {
      await ref.read(authRepositoryProvider).logout();
      state = state.copyWith(isLoading: false);
      return true;
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        apiErrorMessage: error.toString(),
      );
      return false;
    }
  }

  void reset() {
    state = const SettingState();
  }
}
