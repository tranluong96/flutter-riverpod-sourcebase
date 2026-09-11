import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:myapp/app/core/enums/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'network.g.dart';

@riverpod
class Network extends Notifier<NetworkStatus> {
  final InternetConnection _checker = InternetConnection.createInstance(
    triggerStream: Connectivity().onConnectivityChanged,
    checkInterval: const Duration(seconds: 2),
  );

  StreamSubscription<InternetStatus>? _sub;

  @override
  NetworkStatus build() {
    ref.keepAlive();

    _sub ??= _checker.onStatusChange.listen(
      _onChanged,
      onError: (_) {
        if (ref.mounted) state = NetworkStatus.unknown;
      },
    );

    ref.onDispose(() {
      _sub?.cancel();
      _sub = null;
    });

    return stateOrNull ?? NetworkStatus.unknown;
  }

  void _onChanged(InternetStatus status) {
    if (!ref.mounted) return;
    state = status == InternetStatus.connected
        ? NetworkStatus.online
        : NetworkStatus.offline;
  }

  Future<NetworkStatus> recheck() async {
    final connected = await _checker.hasInternetAccess;
    final result = connected ? NetworkStatus.online : NetworkStatus.offline;
    if (!ref.mounted) return result;
    state = result;
    return result;
  }
}
