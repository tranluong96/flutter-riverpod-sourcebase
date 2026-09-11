import 'package:json_annotation/json_annotation.dart';
import 'package:myapp/app/core/extensions/string_ext.dart';
import 'package:myapp/domain/models/auth/auth_model.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  AuthResponse({
    this.companyName,
    this.message,
    this.employeeId,
    this.employeeName,
    this.devicePasscode,
    this.token,
  });

  @JsonKey(name: 'company_name', defaultValue: "")
  final String? companyName;

  @JsonKey(name: 'message', defaultValue: "")
  final String? message;

  @JsonKey(name: 'employee_id', defaultValue: -1)
  final int? employeeId;

  @JsonKey(name: 'employee_name', defaultValue: null)
  final String? employeeName;

  @JsonKey(name: 'device_passcode', defaultValue: "")
  final String? devicePasscode;

  @JsonKey(name: 'token', defaultValue: "")
  final String? token;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  AuthModel toEntity() {
    return AuthModel(
      companyName: companyName.toContent,
      message: message.toContent,
      employeeId: employeeId ?? -1,
      employeeName: employeeName.toContent,
      devicePasscode: devicePasscode.toContent,
      token: token.toContent,
    );
  }
}