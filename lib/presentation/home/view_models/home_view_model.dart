import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/presentation/home/view_models/home_state.dart';

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(
  HomeViewModel.new,
);

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return const HomeState(isLoading: true, products: []);
  }

  // ======================
  // ACTIONS
  // ======================
}
