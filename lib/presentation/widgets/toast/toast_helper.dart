import 'package:myapp/app/core/enums/enums.dart';
import 'package:myapp/presentation/widgets/toast/provider/toast_provider.dart';
import 'package:myapp/presentation/widgets/toast/toast_message.dart';

class ToastHelper {
  static void showInfor(dynamic ref, String message) {
    _show(ref, message, ToastStatus.information);
  }

  static void showSuccess(dynamic ref, String message) {
    _show(ref, message, ToastStatus.success);
  }

  static void showError(dynamic ref, String message) {
    _show(ref, message, ToastStatus.error);
  }

  static void showWarning(dynamic ref, String message) {
    _show(ref, message, ToastStatus.warning);
  }

  static void _show(dynamic ref, String message, ToastStatus status) {
    ref
        .read(toastProvider.notifier)
        .show(ToastMessage(message: message, status: status));
  }
}
