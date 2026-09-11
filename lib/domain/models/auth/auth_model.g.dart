// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
  companyName: json['companyName'] as String,
  employeeId: (json['employeeId'] as num).toInt(),
  employeeName: json['employeeName'] as String,
  devicePasscode: json['devicePasscode'] as String,
  token: json['token'] as String,
  message: json['message'] as String?,
);

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
  'companyName': instance.companyName,
  'employeeId': instance.employeeId,
  'employeeName': instance.employeeName,
  'token': instance.token,
  'devicePasscode': instance.devicePasscode,
  'message': instance.message,
};
