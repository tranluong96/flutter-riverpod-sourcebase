import 'package:myapp/app/core/enums/enums.dart';

class ToastMessage {
  const ToastMessage({
    required this.message,
    this.status = ToastStatus.information,
  });

  final String message;
  final ToastStatus status;
}
