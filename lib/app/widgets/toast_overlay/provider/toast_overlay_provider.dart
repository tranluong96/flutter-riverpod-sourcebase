import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:myapp/app/widgets/toast_overlay/controller/toast_overlay_controller.dart';
import 'package:myapp/data/models/toast/toast_overlay_model.dart';

final toastOverlayProvider =
    StateNotifierProvider<
      ToastOverlayController,
      AsyncValue<ToastOverlayModel?>
    >((ref) => ToastOverlayController());
