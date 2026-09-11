import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.id,
    required this.username,
    required this.role,
    required this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'role')
  final String role;

  @JsonKey(name: 'status')
  final String status;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
