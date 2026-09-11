import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_verify_otp_request.g.dart';

@JsonSerializable()
class RegisterVerifyOtpRequest {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'otp')
  final String otp;

  const RegisterVerifyOtpRequest({
    required this.email,
    required this.password,
    required this.otp,
  });

  factory RegisterVerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterVerifyOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterVerifyOtpRequestToJson(this);
}
