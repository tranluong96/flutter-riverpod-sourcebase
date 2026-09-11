// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FCMController)
final fCMControllerProvider = FCMControllerProvider._();

final class FCMControllerProvider
    extends $NotifierProvider<FCMController, FCMState> {
  FCMControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fCMControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fCMControllerHash();

  @$internal
  @override
  FCMController create() => FCMController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FCMState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FCMState>(value),
    );
  }
}

String _$fCMControllerHash() => r'80c037aceaea004f80b150555e3e2480fccbf18a';

abstract class _$FCMController extends $Notifier<FCMState> {
  FCMState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<FCMState, FCMState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FCMState, FCMState>,
              FCMState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
