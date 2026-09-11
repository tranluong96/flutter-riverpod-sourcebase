import 'package:dio/dio.dart';
import 'package:myapp/i18n/strings.g.dart';

String getApiErrorMessage(dynamic error) {
  if (error is DioException) {
    final systemError = error.type.toErrorSystemDescription();
    final data = error.response?.data;
    final statusCode = error.response?.statusCode;

    if (statusCode != null && statusCode >= 500) {
      return t.message.server_error;
    }
    if (data is Map && data['message'] != null) {
      return data['message'].toString();
    }
    return error.message ?? systemError;
  }
  return error.toString();
}

extension DioExceptionTypeExtensionX on DioExceptionType {
  String toErrorSystemDescription() {
    switch (this) {
      case DioExceptionType.connectionTimeout:
        return t.message.connect_timeout;
      case DioExceptionType.sendTimeout:
        return t.message.sending_timeout;
      case DioExceptionType.receiveTimeout:
        return t.message.receive_timeout;
      case DioExceptionType.badCertificate:
        return t.message.bad_certificate;
      case DioExceptionType.badResponse:
        return t.message.bad_response;
      case DioExceptionType.cancel:
        return t.message.cancel_request;
      case DioExceptionType.connectionError:
        return t.message.connection_error;
      case DioExceptionType.unknown:
        return t.message.unknown;
      case DioExceptionType.transformTimeout:
        throw UnimplementedError();
    }
  }
}
