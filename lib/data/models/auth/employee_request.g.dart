// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeRequest _$EmployeeRequestFromJson(Map<String, dynamic> json) =>
    EmployeeRequest(
      companyCode: json['company_code'] as String,
      deviceId: json['device_id'] as String,
      loginId: json['login_id'] as String,
      employeePassword: json['employee_password'] as String,
    );

Map<String, dynamic> _$EmployeeRequestToJson(EmployeeRequest instance) =>
    <String, dynamic>{
      'company_code': instance.companyCode,
      'device_id': instance.deviceId,
      'login_id': instance.loginId,
      'employee_password': instance.employeePassword,
    };
