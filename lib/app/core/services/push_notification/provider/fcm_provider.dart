import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/services/push_notification/fcm_service.dart';

final fcmServiceProvider = Provider<FCMService>((ref) => FCMService());
