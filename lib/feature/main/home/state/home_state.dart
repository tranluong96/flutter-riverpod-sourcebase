import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required List<String> products,
  }) = _HomeState;

  const HomeState._();

  bool get isIdle => !isLoading;
}
