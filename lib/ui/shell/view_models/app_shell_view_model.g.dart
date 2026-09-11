// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_shell_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppShellViewModel)
final appShellViewModelProvider = AppShellViewModelProvider._();

final class AppShellViewModelProvider
    extends $NotifierProvider<AppShellViewModel, AppShellState> {
  AppShellViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appShellViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appShellViewModelHash();

  @$internal
  @override
  AppShellViewModel create() => AppShellViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppShellState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppShellState>(value),
    );
  }
}

String _$appShellViewModelHash() => r'76aa11c6faa418c48e8d2a1306aa925ce4ded62f';

abstract class _$AppShellViewModel extends $Notifier<AppShellState> {
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
