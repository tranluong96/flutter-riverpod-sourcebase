import 'package:dio/dio.dart';
import 'package:myapp/app/helpers/message_helper.dart';

class ApiHelper {
  static String extractErrorMessage(Object e) {
    if (e is DioException) {
      final data = e.response?.data;
      if (data is Map) {
        return data['message']?.toString() ??
            MessageHelper.internetDisconnected;
      }
    }
    return MessageHelper.internetDisconnected;
  }
}
