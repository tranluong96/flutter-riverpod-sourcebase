import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  const ProductResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
  });

  final int id;
  final String title;
  final String description;
  final String category;
  final double price;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
