import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'statusCode')
  final String? statusCode;

  const RegisterResponse({this.message, this.statusCode});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
