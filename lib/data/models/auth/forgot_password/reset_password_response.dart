import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  const ResetPasswordResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);

  @JsonKey(name: 'accessToken')
  final String accessToken;

  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);
}
