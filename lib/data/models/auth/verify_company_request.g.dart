// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_company_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCompanyRequest _$VerifyCompanyRequestFromJson(
  Map<String, dynamic> json,
) => VerifyCompanyRequest(
  companyCode: json['company_code'] as String,
  deviceId: json['device_id'] as String,
);

Map<String, dynamic> _$VerifyCompanyRequestToJson(
  VerifyCompanyRequest instance,
) => <String, dynamic>{
  'company_code': instance.companyCode,
  'device_id': instance.deviceId,
};
