import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_otp_response.g.dart';

@JsonSerializable()
class ResendOTPResponse {
  const ResendOTPResponse({required this.message, required this.statusCode});

  factory ResendOTPResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendOTPResponseFromJson(json);

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'statusCode')
  final String statusCode;

  Map<String, dynamic> toJson() => _$ResendOTPResponseToJson(this);
}
