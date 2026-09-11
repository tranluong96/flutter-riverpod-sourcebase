import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_response.g.dart';

@JsonSerializable()
class VerifyOtpResponse {
  const VerifyOtpResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseFromJson(json);

  @JsonKey(name: 'statusCode')
  final String statusCode;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final VerifyOtpData data;

  Map<String, dynamic> toJson() => _$VerifyOtpResponseToJson(this);
}

@JsonSerializable()
class VerifyOtpData {
  const VerifyOtpData({required this.resetToken, required this.expiresIn});

  factory VerifyOtpData.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpDataFromJson(json);

  @JsonKey(name: 'resetToken')
  final String resetToken;

  @JsonKey(name: 'expiresIn')
  final int expiresIn;

  Map<String, dynamic> toJson() => _$VerifyOtpDataToJson(this);
}
