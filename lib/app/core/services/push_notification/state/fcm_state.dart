import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_state.freezed.dart';

@freezed
abstract class FCMState with _$FCMState {
  const factory FCMState({
    @Default(false) bool permissionGranted,
    String? deviceToken,
    Map<String, dynamic>? lastMessage,
    @Default(false) bool openedFromNotification,
  }) = _FCMState;
}
