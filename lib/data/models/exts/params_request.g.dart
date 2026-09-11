// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamsRequest _$ParamsRequestFromJson(Map<String, dynamic> json) =>
    ParamsRequest(
      limit: (json['limit'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      name: json['name'] as String?,
      keyword: json['keyword'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$ParamsRequestToJson(ParamsRequest instance) =>
    <String, dynamic>{
      'limit': ?instance.limit,
      'page': ?instance.page,
      'name': ?instance.name,
      'quantity': ?instance.quantity,
      'keyword': ?instance.keyword,
      'category': ?instance.category,
    };
