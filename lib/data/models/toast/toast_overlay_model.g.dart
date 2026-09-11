// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toast_overlay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToastOverlayModel _$ToastOverlayModelFromJson(Map<String, dynamic> json) =>
    ToastOverlayModel(
      message: json['message'] as String,
      status: $enumDecodeNullable(_$EToastTypeEnumMap, json['status']),
    );

Map<String, dynamic> _$ToastOverlayModelToJson(ToastOverlayModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': _$EToastTypeEnumMap[instance.status],
    };

const _$EToastTypeEnumMap = {
  EToastType.success: 'success',
  EToastType.warning: 'warning',
  EToastType.error: 'error',
};
