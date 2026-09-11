// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendOTPResponse _$ResendOTPResponseFromJson(Map<String, dynamic> json) =>
    ResendOTPResponse(
      message: json['message'] as String,
      statusCode: json['statusCode'] as String,
    );

Map<String, dynamic> _$ResendOTPResponseToJson(ResendOTPResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
