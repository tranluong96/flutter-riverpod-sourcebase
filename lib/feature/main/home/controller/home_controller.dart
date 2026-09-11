import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/feature/main/home/state/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "home_controller.g.dart";

@riverpod
class HomeController extends Notifier<HomeState> {
  @override
  HomeState build() {
    return const HomeState(isLoading: true, products: []);
  }

  // ======================
  // ACTIONS
  // ======================
}
