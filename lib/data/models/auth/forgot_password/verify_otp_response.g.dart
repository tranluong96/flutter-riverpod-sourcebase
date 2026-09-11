// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) =>
    VerifyOtpResponse(
      statusCode: json['statusCode'] as String,
      message: json['message'] as String,
      data: VerifyOtpData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyOtpResponseToJson(VerifyOtpResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

VerifyOtpData _$VerifyOtpDataFromJson(Map<String, dynamic> json) =>
    VerifyOtpData(
      resetToken: json['resetToken'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
    );

Map<String, dynamic> _$VerifyOtpDataToJson(VerifyOtpData instance) =>
    <String, dynamic>{
      'resetToken': instance.resetToken,
      'expiresIn': instance.expiresIn,
    };
