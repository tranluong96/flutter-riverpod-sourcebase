// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterVerifyOtpResponse _$RegisterVerifyOtpResponseFromJson(
  Map<String, dynamic> json,
) => RegisterVerifyOtpResponse(
  statusCode: json['statusCode'] as String,
  message: json['message'] as String,
  data: json['data'] == null
      ? null
      : RegisterVerifyOtpData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterVerifyOtpResponseToJson(
  RegisterVerifyOtpResponse instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};

RegisterVerifyOtpData _$RegisterVerifyOtpDataFromJson(
  Map<String, dynamic> json,
) => RegisterVerifyOtpData(
  message: json['message'] as String?,
  user: json['user'] == null
      ? null
      : UserRegistrationModel.fromJson(json['user'] as Map<String, dynamic>),
  accessToken: json['accessToken'] as String?,
  refreshToken: json['refreshToken'] as String?,
);

Map<String, dynamic> _$RegisterVerifyOtpDataToJson(
  RegisterVerifyOtpData instance,
) => <String, dynamic>{
  'message': instance.message,
  'user': instance.user,
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};

UserRegistrationModel _$UserRegistrationModelFromJson(
  Map<String, dynamic> json,
) => UserRegistrationModel(
  id: json['id'] as String?,
  companyId: json['companyId'] as String?,
  userCode: json['userCode'] as String?,
  email: json['email'] as String?,
  userName: json['userName'] as String?,
  gender: json['gender'] as String?,
  birthday: json['birthday'] as String?,
  employeeId: json['employeeId'] as String?,
  linkStatus: json['linkStatus'] as String?,
  linkedAt: json['linkedAt'] as String?,
  unlinkedAt: json['unlinkedAt'] as String?,
  accountStatus: json['accountStatus'] as String?,
  unlinkedBy: json['unlinkedBy'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  deletedAt: json['deletedAt'] as String?,
);

Map<String, dynamic> _$UserRegistrationModelToJson(
  UserRegistrationModel instance,
) => <String, dynamic>{
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
  'unlinkedBy': instance.unlinkedBy,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
};
