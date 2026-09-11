import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable(includeIfNull: false)
class RegisterRequest {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'userName')
  final String? userName;

  @JsonKey(name: 'gender')
  final String? gender;

  @JsonKey(name: 'birthday')
  final String? birthday;

  @JsonKey(name: 'companyCode')
  final String? companyCode;

  @JsonKey(name: 'employeeId')
  final String? employeeId;

  const RegisterRequest({
    required this.email,
    this.userName,
    this.gender,
    this.birthday,
    this.companyCode,
    this.employeeId,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
