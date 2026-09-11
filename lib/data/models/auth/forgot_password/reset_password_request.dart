import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable()
class ResetPasswordRequest {
  const ResetPasswordRequest({required this.token, required this.newPassword});

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'newPassword')
  final String newPassword;

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
