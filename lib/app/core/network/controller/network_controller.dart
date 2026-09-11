import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:myapp/app/core/enums/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Watches **real internet reachability** (validates access to real endpoints,
/// not just the network interface) and exposes it as [NetworkStatus].
///
/// Detection is near-instant: `triggerStream` wires the OS connectivity events
/// (Wi-Fi / cellular toggled) so the moment the interface changes we re-verify
/// reachability, instead of waiting for the next polling tick. The periodic
/// [checkInterval] is only a fallback for changes the OS doesn't surface
/// (e.g. captive portals, silent drops).

part 'network_controller.g.dart';

@riverpod
class NetworkController extends Notifier<NetworkStatus> {
  final InternetConnection _checker = InternetConnection.createInstance(
    triggerStream: Connectivity().onConnectivityChanged,
    checkInterval: const Duration(seconds: 5),
  );

  StreamSubscription<InternetStatus>? _sub;

  @override
  NetworkStatus build() {
    // A single long-lived subscription. The stream performs a check as soon as
    // it is listened to, so the initial online/offline value arrives shortly
    // after startup; until then the state stays [NetworkStatus.unknown].
    _sub ??= _checker.onStatusChange.listen(
      _onChanged,
      // If the stream ever errors, fall back to [unknown] instead of leaving a
      // stale value with a dead subscription.
      onError: (_) => state = NetworkStatus.unknown,
    );

    ref.onDispose(() {
      _sub?.cancel();
      _sub = null;
    });

    return stateOrNull ?? NetworkStatus.unknown;
  }

  void _onChanged(InternetStatus status) {
    state = status == InternetStatus.connected
        ? NetworkStatus.online
        : NetworkStatus.offline;
  }

  /// Forces an immediate reachability check and updates the state.
  ///
  /// Used by [NetworkInterceptor] to resolve an [NetworkStatus.unknown] state
  /// before the first request, and suitable for a manual "Retry" action on an
  /// offline screen/banner.
  Future<NetworkStatus> recheck() async {
    final connected = await _checker.hasInternetAccess;
    final result = connected ? NetworkStatus.online : NetworkStatus.offline;
    state = result;
    return result;
  }
}
