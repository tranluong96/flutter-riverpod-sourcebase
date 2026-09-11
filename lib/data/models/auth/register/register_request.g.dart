// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      email: json['email'] as String,
      userName: json['userName'] as String?,
      gender: json['gender'] as String?,
      birthday: json['birthday'] as String?,
      companyCode: json['companyCode'] as String?,
      employeeId: json['employeeId'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'userName': ?instance.userName,
      'gender': ?instance.gender,
      'birthday': ?instance.birthday,
      'companyCode': ?instance.companyCode,
      'employeeId': ?instance.employeeId,
    };
