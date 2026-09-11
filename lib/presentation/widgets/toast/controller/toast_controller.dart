import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:myapp/presentation/widgets/toast/toast_message.dart';

class ToastController
    extends StateNotifier<AsyncValue<ToastMessage?>> {
  ToastController() : super(const AsyncValue.data(null));

  Timer? _timer;

  void show(
    ToastMessage message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    state = AsyncValue.data(message);

    _timer?.cancel();
    _timer = Timer(duration, hide);
  }

  void hide() {
    state = const AsyncValue.data(null);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
