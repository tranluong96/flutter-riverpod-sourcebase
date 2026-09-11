import 'package:hooks_riverpod/hooks_riverpod.dart';

class ToastEvent {
  const ToastEvent({required this.message, required this.sequence});

  final String message;
  final int sequence;
}

final toastEventProvider =
    NotifierProvider<ToastEventNotifier, ToastEvent?>(
      ToastEventNotifier.new,
    );

class ToastEventNotifier extends Notifier<ToastEvent?> {
  int _sequence = 0;

  @override
  ToastEvent? build() => null;

  void publish(String message) {
    state = ToastEvent(message: message, sequence: ++_sequence);
  }
}
