import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_request.g.dart';

@JsonSerializable()
class ForgotPasswordRequest {
  const ForgotPasswordRequest({required this.email});

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);

  @JsonKey(name: 'email')
  final String email;

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);
}
