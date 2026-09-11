import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_verify_otp_response.g.dart';

@JsonSerializable()
class RegisterVerifyOtpResponse {
  @JsonKey(name: 'statusCode')
  final String statusCode;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final RegisterVerifyOtpData? data;

  const RegisterVerifyOtpResponse({
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory RegisterVerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterVerifyOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterVerifyOtpResponseToJson(this);
}

@JsonSerializable()
class RegisterVerifyOtpData {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'user')
  final UserRegistrationModel? user;

  @JsonKey(name: 'accessToken')
  final String? accessToken;

  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  const RegisterVerifyOtpData({
    this.message,
    this.user,
    this.accessToken,
    this.refreshToken,
  });

  factory RegisterVerifyOtpData.fromJson(Map<String, dynamic> json) =>
      _$RegisterVerifyOtpDataFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterVerifyOtpDataToJson(this);
}

@JsonSerializable()
class UserRegistrationModel {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'companyId')
  final String? companyId;

  @JsonKey(name: 'userCode')
  final String? userCode;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'userName')
  final String? userName;

  @JsonKey(name: 'gender')
  final String? gender;

  @JsonKey(name: 'birthday')
  final String? birthday;

  @JsonKey(name: 'employeeId')
  final String? employeeId;

  @JsonKey(name: 'linkStatus')
  final String? linkStatus;

  @JsonKey(name: 'linkedAt')
  final String? linkedAt;

  @JsonKey(name: 'unlinkedAt')
  final String? unlinkedAt;

  @JsonKey(name: 'accountStatus')
  final String? accountStatus;

  @JsonKey(name: 'unlinkedBy')
  final String? unlinkedBy;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  @JsonKey(name: 'deletedAt')
  final String? deletedAt;

  const UserRegistrationModel({
    this.id,
    this.companyId,
    this.userCode,
    this.email,
    this.userName,
    this.gender,
    this.birthday,
    this.employeeId,
    this.linkStatus,
    this.linkedAt,
    this.unlinkedAt,
    this.accountStatus,
    this.unlinkedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory UserRegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$UserRegistrationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegistrationModelToJson(this);
}
