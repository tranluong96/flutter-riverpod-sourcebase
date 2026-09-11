import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'companyId')
  String? companyId;
  @JsonKey(name: 'userCode')
  String userCode;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'userName')
  String? userName;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'birthday')
  String? birthday;
  @JsonKey(name: 'employeeId')
  String? employeeId;
  @JsonKey(name: 'linkStatus')
  String? linkStatus;
  @JsonKey(name: 'linkedAt')
  String? linkedAt;
  @JsonKey(name: 'unlinkedAt')
  String? unlinkedAt;
  @JsonKey(name: 'accountStatus')
  String? accountStatus;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: 'company')
  Company? company;

  UserResponseModel({
    required this.id,
    required this.companyId,
    required this.userCode,
    required this.email,
    this.userName,
    this.gender,
    this.birthday,
    this.employeeId,
    this.linkStatus,
    this.linkedAt,
    this.unlinkedAt,
    this.accountStatus,
    this.createdAt,
    this.updatedAt,
    this.company,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}

@JsonSerializable()
class Company {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'companyCode')
  String companyCode;
  @JsonKey(name: 'companyName')
  String companyName;

  Company({
    required this.id,
    required this.companyCode,
    required this.companyName,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
