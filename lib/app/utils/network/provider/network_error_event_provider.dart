import 'package:hooks_riverpod/hooks_riverpod.dart';

class NetworkErrorEvent {
  const NetworkErrorEvent({required this.message, required this.sequence});

  final String message;
  final int sequence;
}

final networkErrorEventProvider =
    NotifierProvider<NetworkErrorEventNotifier, NetworkErrorEvent?>(
      NetworkErrorEventNotifier.new,
    );

class NetworkErrorEventNotifier extends Notifier<NetworkErrorEvent?> {
  int _sequence = 0;

  @override
  NetworkErrorEvent? build() => null;

  void publish(String message) {
    state = NetworkErrorEvent(message: message, sequence: ++_sequence);
  }
}
