import 'package:vibration/vibration.dart';

class VibrationHelper {
  static void vibrate() {
    Vibration.vibrate(duration: 250);
  }
}
