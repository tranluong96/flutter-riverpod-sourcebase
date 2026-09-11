import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:myapp/presentation/widgets/toast_overlay/controller/toast_overlay_controller.dart';
import 'package:myapp/presentation/widgets/toast_overlay/toast_message.dart';

final toastOverlayProvider =
    StateNotifierProvider<
      ToastOverlayController,
      AsyncValue<ToastMessage?>
    >((ref) => ToastOverlayController());
