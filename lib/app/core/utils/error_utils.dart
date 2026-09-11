import 'package:dio/dio.dart';

String getApiErrorMessage(dynamic error) {
  if (error is DioException) {
    final systemError = error.type.toErrorSystemDescription();
    final data = error.response?.data;
    final statusCode = error.response?.statusCode;

    if (statusCode != null && statusCode >= 500) {
      return 'サーバーエラーが発生しました';
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
        return '接続がタイムアウトしました';
      case DioExceptionType.sendTimeout:
        return '送信がタイムアウトしました';
      case DioExceptionType.receiveTimeout:
        return '受信がタイムアウトしました';
      case DioExceptionType.badCertificate:
        return '不正な証明書です';
      case DioExceptionType.badResponse:
        return '不正なレスポンスです';
      case DioExceptionType.cancel:
        return 'リクエストがキャンセルされました';
      case DioExceptionType.connectionError:
        return '接続エラーが発生しました';
      case DioExceptionType.unknown:
        return '不明なエラーが発生しました';
      case DioExceptionType.transformTimeout:
        throw UnimplementedError();
    }
  }
}
