// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_shell_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppShellController)
final appShellControllerProvider = AppShellControllerProvider._();

final class AppShellControllerProvider
    extends $NotifierProvider<AppShellController, AppShellState> {
  AppShellControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appShellControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appShellControllerHash();

  @$internal
  @override
  AppShellController create() => AppShellController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppShellState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppShellState>(value),
    );
  }
}

String _$appShellControllerHash() =>
    r'a524250d6cc6bfc44385a51b0e5f108969e13600';

abstract class _$AppShellController extends $Notifier<AppShellState> {
  AppShellState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AppShellState, AppShellState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppShellState, AppShellState>,
              AppShellState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
