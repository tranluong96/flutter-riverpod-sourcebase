// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_company_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VerifyCompanyViewModel)
final verifyCompanyViewModelProvider = VerifyCompanyViewModelProvider._();

final class VerifyCompanyViewModelProvider
    extends $NotifierProvider<VerifyCompanyViewModel, VerifyCompanyState> {
  VerifyCompanyViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'verifyCompanyViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$verifyCompanyViewModelHash();

  @$internal
  @override
  VerifyCompanyViewModel create() => VerifyCompanyViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VerifyCompanyState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VerifyCompanyState>(value),
    );
  }
}

String _$verifyCompanyViewModelHash() =>
    r'ed50196dc05bfbfe4baca0b94f145e5310646fe2';

abstract class _$VerifyCompanyViewModel extends $Notifier<VerifyCompanyState> {
  VerifyCompanyState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<VerifyCompanyState, VerifyCompanyState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VerifyCompanyState, VerifyCompanyState>,
              VerifyCompanyState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
