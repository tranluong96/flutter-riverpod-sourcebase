import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/data/models/app/app_version_model.dart';

part 'app_shell_state.freezed.dart';

@freezed
abstract class AppShellState with _$AppShellState {
  const factory AppShellState({
    AppVersionModel? versionInfo,
    @Default(false) bool hasNewVersion,
    @Default(false) bool doNotShowAgain,
  }) = _AppShellState;

  const AppShellState._();

  bool get isForceUpdate => versionInfo?.isRequired ?? false;
  bool get shouldShowModal => hasNewVersion && !doNotShowAgain;
}
