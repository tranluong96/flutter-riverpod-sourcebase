import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myapp/app/configs/socket_config.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;
  SocketService._internal();

  io.Socket? _socket;

  void connect() {
    final url = dotenv.env['SOCKET_URL'] ?? '';
    if (url.isEmpty || _socket?.connected == true) return;

    _socket = io.io(
      url,
      io.OptionBuilder()
          .setTransports(SocketConfig.transports)
          .disableAutoConnect()
          .build(),
    );

    _socket!.connect();
  }

  Future<Map<String, dynamic>?> waitForChargeResult(
    String chargeId, {
    Duration timeout = SocketConfig.chargeResultTimeout,
  }) {
    final completer = Completer<Map<String, dynamic>?>();

    void resolve(Map<String, dynamic> data) {
      if (!completer.isCompleted && data['id'] == chargeId) {
        completer.complete(data);
      }
    }

    _socket?.on(SocketConfig.chargeSucceeded, (data) {
      resolve(Map<String, dynamic>.from(data as Map));
    });

    _socket?.on(SocketConfig.chargeFailed, (data) {
      resolve(Map<String, dynamic>.from(data as Map));
    });

    Future.delayed(timeout, () {
      if (!completer.isCompleted) completer.complete(null);
    });

    return completer.future;
  }

  void disconnect() {
    _socket?.disconnect();
    _socket = null;
  }
}
