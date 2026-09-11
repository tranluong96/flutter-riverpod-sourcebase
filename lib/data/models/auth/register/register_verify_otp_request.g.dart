// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_verify_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterVerifyOtpRequest _$RegisterVerifyOtpRequestFromJson(
  Map<String, dynamic> json,
) => RegisterVerifyOtpRequest(
  email: json['email'] as String,
  password: json['password'] as String,
  otp: json['otp'] as String,
);

Map<String, dynamic> _$RegisterVerifyOtpRequestToJson(
  RegisterVerifyOtpRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'otp': instance.otp,
};
