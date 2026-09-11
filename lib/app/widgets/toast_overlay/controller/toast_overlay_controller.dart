import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:myapp/data/models/toast/toast_overlay_model.dart';

class ToastOverlayController
    extends StateNotifier<AsyncValue<ToastOverlayModel?>> {
  ToastOverlayController() : super(const AsyncValue.data(null));

  Timer? _timer;

  void show(
    ToastOverlayModel error, {
    Duration duration = const Duration(seconds: 3),
  }) {
    state = AsyncValue.data(error);

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
