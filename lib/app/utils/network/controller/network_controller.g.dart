// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NetworkController)
final networkControllerProvider = NetworkControllerProvider._();

final class NetworkControllerProvider
    extends $NotifierProvider<NetworkController, NetworkStatus> {
  NetworkControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkControllerHash();

  @$internal
  @override
  NetworkController create() => NetworkController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkStatus>(value),
    );
  }
}

String _$networkControllerHash() => r'4e5881b1caac2df5907daa38075f0b2a6a78e0a5';

abstract class _$NetworkController extends $Notifier<NetworkStatus> {
  NetworkStatus build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<NetworkStatus, NetworkStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NetworkStatus, NetworkStatus>,
              NetworkStatus,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
