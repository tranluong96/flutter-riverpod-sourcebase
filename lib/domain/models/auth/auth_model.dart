import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  final String companyName;
  final int employeeId;
  final String employeeName;
  final String token;
  final String devicePasscode;

  /// Message is case of error, it will be empty if Employee is not found.
  final String? message;

  AuthModel({
    required this.companyName,
    required this.employeeId,
    required this.employeeName,
    required this.devicePasscode,
    required this.token,
    this.message,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
