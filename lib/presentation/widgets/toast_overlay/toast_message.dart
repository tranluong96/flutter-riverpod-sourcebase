import 'package:myapp/app/core/enums/enums.dart';

class ToastMessage {
  const ToastMessage({required this.message, this.status});

  final String message;
  final EToastType? status;
}
