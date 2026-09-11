import 'package:dio/dio.dart';
import 'package:myapp/i18n/strings.g.dart';

String getApiErrorMessage(dynamic error) {
  if (error is! DioException) return error.toString();

  final statusCode = error.response?.statusCode;
  if (statusCode != null && statusCode >= 500) {
    return t.message.server_error;
  }

  final message = _extractMessage(error.response?.data);
  if (message != null) return message;

  return error.message ?? error.type.toErrorSystemDescription();
}

const _priorityKeys = ['message', 'detail', 'error', 'non_field_errors'];

String? _extractMessage(dynamic data) {
  if (data == null) return null;

  if (data is String) {
    final text = data.trim();
    if (text.isEmpty || text.startsWith('<')) return null;
    return text;
  }

  if (data is List) {
    return _join(data.map(_extractMessage));
  }

  if (data is Map) {
    for (final key in _priorityKeys) {
      final msg = _extractMessage(data[key]);
      if (msg != null) return msg;
    }
    return _join(data.values.map(_extractMessage));
  }

  return data.toString();
}

String? _join(Iterable<String?> messages) {
  final list = messages.whereType<String>().toList();
  return list.isEmpty ? null : list.join('\n');
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
