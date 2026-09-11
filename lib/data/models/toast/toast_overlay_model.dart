import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/app/core/enums/enums.dart';

part 'toast_overlay_model.g.dart';

@JsonSerializable()
class ToastOverlayModel {
  const ToastOverlayModel({required this.message, this.status});

  factory ToastOverlayModel.fromJson(Map<String, dynamic> json) =>
      _$ToastOverlayModelFromJson(json);

  final String message;
  final EToastType? status;

  Map<String, dynamic> toJson() => _$ToastOverlayModelToJson(this);
}
