// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LanguageService)
final languageServiceProvider = LanguageServiceProvider._();

final class LanguageServiceProvider
    extends $NotifierProvider<LanguageService, LanguageState> {
  LanguageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'languageServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$languageServiceHash();

  @$internal
  @override
  LanguageService create() => LanguageService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LanguageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LanguageState>(value),
    );
  }
}

String _$languageServiceHash() => r'678179a97f1b4aef41ef982737e7efc5c180de12';

abstract class _$LanguageService extends $Notifier<LanguageState> {
  LanguageState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<LanguageState, LanguageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LanguageState, LanguageState>,
              LanguageState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
