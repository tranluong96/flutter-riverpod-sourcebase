import 'package:myapp/app/core/enums/enums.dart';
import 'package:myapp/app/widgets/toast_overlay/provider/toast_overlay_provider.dart';
import 'package:myapp/data/models/toast/toast_overlay_model.dart';

class ToastHelper {
  static void showSuccess(dynamic ref, String message) {
    _show(ref, message, EToastType.success);
  }

  static void showError(dynamic ref, String message) {
    _show(ref, message, EToastType.error);
  }

  static void showWarning(dynamic ref, String message) {
    _show(ref, message, EToastType.warning);
  }

  static void _show(dynamic ref, String message, EToastType status) {
    ref
        .read(toastOverlayProvider.notifier)
        .show(ToastOverlayModel(message: message, status: status));
  }
}
