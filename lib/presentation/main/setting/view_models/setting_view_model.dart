import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/presentation/main/setting/view_models/setting_state.dart';

final settingViewModelProvider =
    NotifierProvider<SettingViewModel, SettingState>(SettingViewModel.new);

class SettingViewModel extends Notifier<SettingState> {
  @override
  SettingState build() {
    return const SettingState();
  }

  Future<bool> logout() async {
    state = state.copyWith(isLoading: false);
    return false;
  }

  void reset() {
    state = const SettingState();
  }
}
