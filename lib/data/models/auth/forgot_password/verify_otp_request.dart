import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_request.g.dart';

@JsonSerializable()
class VerifyOtpRequest {
  const VerifyOtpRequest({required this.email, required this.otp});

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestFromJson(json);

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'otp')
  final String otp;

  Map<String, dynamic> toJson() => _$VerifyOtpRequestToJson(this);
}
