import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_response.g.dart';

@JsonSerializable()
class ForgotPasswordResponse {
  const ForgotPasswordResponse({
    required this.message,
    required this.statusCode,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'statusCode')
  final String statusCode;

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}
