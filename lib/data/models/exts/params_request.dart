import 'package:json_annotation/json_annotation.dart';

part 'params_request.g.dart';

@JsonSerializable(includeIfNull: false)
class ParamsRequest {
  final int? limit;
  final int? page;
  final String? name;
  final int? quantity;
  final String? keyword;
  final String? category;

  const ParamsRequest({
    this.limit,
    this.page,
    this.quantity,
    this.name,
    this.keyword,
    this.category,
  });

  factory ParamsRequest.fromJson(Map<String, dynamic> json) =>
      _$ParamsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsRequestToJson(this);
}
