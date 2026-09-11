// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      id: json['id'] as String,
      companyId: json['companyId'] as String?,
      userCode: json['userCode'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String?,
      gender: json['gender'] as String?,
      birthday: json['birthday'] as String?,
      employeeId: json['employeeId'] as String?,
      linkStatus: json['linkStatus'] as String?,
      linkedAt: json['linkedAt'] as String?,
      unlinkedAt: json['unlinkedAt'] as String?,
      accountStatus: json['accountStatus'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'userCode': instance.userCode,
      'email': instance.email,
      'userName': instance.userName,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'employeeId': instance.employeeId,
      'linkStatus': instance.linkStatus,
      'linkedAt': instance.linkedAt,
      'unlinkedAt': instance.unlinkedAt,
      'accountStatus': instance.accountStatus,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'company': instance.company,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
  id: json['id'] as String,
  companyCode: json['companyCode'] as String,
  companyName: json['companyName'] as String,
);

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
  'id': instance.id,
  'companyCode': instance.companyCode,
  'companyName': instance.companyName,
};
