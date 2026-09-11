import 'package:json_annotation/json_annotation.dart';
import 'package:myapp/app/core/enums/enums.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  @JsonKey(name: 'id', defaultValue: '')
  final String id;

  @JsonKey(name: 'title', defaultValue: '')
  final String title;

  @JsonKey(name: 'content', defaultValue: '')
  final String content;

  @JsonKey(
    name: 'type',
    fromJson: NotificationType.fromString,
    toJson: _notificationTypeToJson,
  )
  final NotificationType type;

  @JsonKey(name: 'body')
  final NotificationBody? body;

  @JsonKey(name: 'isRead', defaultValue: false)
  final bool isRead;

  @JsonKey(name: 'readAt')
  final DateTime? readAt;

  @JsonKey(name: 'createdAt')
  final DateTime createdAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    this.body,
    required this.isRead,
    required this.readAt,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  NotificationModel copyWith({
    String? id,
    String? title,
    String? content,
    NotificationType? type,
    NotificationBody? body,
    bool? isRead,
    DateTime? readAt,
    DateTime? createdAt,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      type: type ?? this.type,
      body: body ?? this.body,
      isRead: isRead ?? this.isRead,
      readAt: readAt ?? this.readAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  static String _notificationTypeToJson(NotificationType type) => type.name;
}

@JsonSerializable()
class NotificationBody {
  @JsonKey(name: 'orderId', defaultValue: '')
  final String orderId;

  @JsonKey(name: 'link', defaultValue: '')
  final String link;

  @JsonKey(name: 'preViewLink', defaultValue: '')
  final String previewLink;

  const NotificationBody({
    required this.orderId,
    required this.link,
    required this.previewLink,
  });

  factory NotificationBody.fromJson(Map<String, dynamic> json) =>
      _$NotificationBodyFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationBodyToJson(this);
}
