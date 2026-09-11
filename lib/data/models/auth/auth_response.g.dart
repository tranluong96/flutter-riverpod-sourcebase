// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
  companyName: json['company_name'] as String? ?? '',
  message: json['message'] as String? ?? '',
  employeeId: (json['employee_id'] as num?)?.toInt() ?? -1,
  employeeName: json['employee_name'] as String?,
  devicePasscode: json['device_passcode'] as String? ?? '',
  token: json['token'] as String? ?? '',
);

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'company_name': instance.companyName,
      'message': instance.message,
      'employee_id': instance.employeeId,
      'employee_name': instance.employeeName,
      'device_passcode': instance.devicePasscode,
      'token': instance.token,
    };
