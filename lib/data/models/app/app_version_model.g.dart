// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppVersionModel _$AppVersionModelFromJson(Map<String, dynamic> json) =>
    AppVersionModel(
      platform: json['platform'] as String,
      minVersion: json['minVersion'] as String,
      latestVersion: json['latestVersion'] as String,
      isRequired: json['isRequired'] as bool,
      isRecommended: json['isRecommended'] as bool,
      message: json['message'] as String?,
      storeUrl: json['storeUrl'] as String?,
    );

Map<String, dynamic> _$AppVersionModelToJson(AppVersionModel instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'minVersion': instance.minVersion,
      'latestVersion': instance.latestVersion,
      'isRequired': instance.isRequired,
      'isRecommended': instance.isRecommended,
      'message': instance.message,
      'storeUrl': instance.storeUrl,
    };
