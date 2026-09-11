import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_otp_request.g.dart';

@JsonSerializable()
class ResendOTPRequest {
  const ResendOTPRequest({required this.email});

  factory ResendOTPRequest.fromJson(Map<String, dynamic> json) =>
      _$ResendOTPRequestFromJson(json);

  @JsonKey(name: 'email')
  final String email;

  Map<String, dynamic> toJson() => _$ResendOTPRequestToJson(this);
}
