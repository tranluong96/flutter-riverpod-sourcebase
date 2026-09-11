import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:myapp/ui/widgets/toast/controller/toast_controller.dart';
import 'package:myapp/ui/widgets/toast/toast_message.dart';

final toastProvider =
    StateNotifierProvider<
      ToastController,
      AsyncValue<ToastMessage?>
    >((ref) => ToastController());
