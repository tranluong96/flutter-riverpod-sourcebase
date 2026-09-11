import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_token_request.g.dart';

@JsonSerializable()
class DeviceTokenRequest {
  @JsonKey(name: 'fcmToken')
  final String fcmToken;

  @JsonKey(name: 'platform')
  final String platform;

  const DeviceTokenRequest({required this.fcmToken, required this.platform});

  factory DeviceTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$DeviceTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceTokenRequestToJson(this);
}
