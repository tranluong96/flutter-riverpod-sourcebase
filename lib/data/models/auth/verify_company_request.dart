import 'package:json_annotation/json_annotation.dart';

part 'verify_company_request.g.dart';

@JsonSerializable()
class VerifyCompanyRequest {
  VerifyCompanyRequest({
    required this.companyCode,
    required this.deviceId,
  });

  @JsonKey(name: 'company_code')
  final String companyCode;

  @JsonKey(name: 'device_id')
  final String deviceId;

  factory VerifyCompanyRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyCompanyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCompanyRequestToJson(this);
}