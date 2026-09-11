// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
  companyCode: json['companyCode'] as String,
  deviceId: json['deviceId'] as String,
  token: json['token'] as String,
);

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'companyCode': instance.companyCode,
      'deviceId': instance.deviceId,
      'token': instance.token,
    };
