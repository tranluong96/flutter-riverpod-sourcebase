import 'package:myapp/app/core/enums/enums.dart';
import 'package:myapp/presentation/widgets/toast_overlay/provider/toast_overlay_provider.dart';
import 'package:myapp/presentation/widgets/toast_overlay/toast_message.dart';

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
        .show(ToastMessage(message: message, status: status));
  }
}
