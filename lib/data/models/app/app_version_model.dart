import 'package:json_annotation/json_annotation.dart';

part 'app_version_model.g.dart';

@JsonSerializable()
class AppVersionModel {
  const AppVersionModel({
    required this.platform,
    required this.minVersion,
    required this.latestVersion,
    required this.isRequired,
    required this.isRecommended,
    this.message,
    this.storeUrl,
  });

  factory AppVersionModel.fromJson(Map<String, dynamic> json) =>
      _$AppVersionModelFromJson(json);

  @JsonKey(name: 'platform')
  final String platform;

  @JsonKey(name: 'minVersion')
  final String minVersion;

  @JsonKey(name: 'latestVersion')
  final String latestVersion;

  @JsonKey(name: 'isRequired')
  final bool isRequired;

  @JsonKey(name: 'isRecommended')
  final bool isRecommended;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'storeUrl')
  final String? storeUrl;

  Map<String, dynamic> toJson() => _$AppVersionModelToJson(this);
}
