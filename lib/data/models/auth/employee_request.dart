import 'package:json_annotation/json_annotation.dart';

part 'employee_request.g.dart';

@JsonSerializable()
class EmployeeRequest {
  EmployeeRequest({
    required this.companyCode,
    required this.deviceId,
    required this.loginId,
    required this.employeePassword,
  });

  @JsonKey(name: 'company_code')
  final String companyCode;

  @JsonKey(name: 'device_id')
  final String deviceId;

  @JsonKey(name: 'login_id')
  final String loginId;

  @JsonKey(name: 'employee_password')
  final String employeePassword;

  factory EmployeeRequest.fromJson(Map<String, dynamic> json) =>
      _$EmployeeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeRequestToJson(this);
}