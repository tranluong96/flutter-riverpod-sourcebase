/// Key dùng trong `RequestOptions.extra` để bật/tắt hành vi UI toàn cục cho
/// từng request (đọc bởi [GlobalUiInterceptor]).
///
/// Cách dùng với retrofit:
/// ```dart
/// @Extra({ApiExtraKeys.showLoading: true})
/// @POST(APPEndpoints.loginAPI)
/// Future<UserOutput> loginAPI(@Body() LoginInput input);
/// ```
/// Hoặc truyền động qua `Options(extra: {ApiExtraKeys.skipError: true})`.
abstract class ExtraKeys {
  /// `true` → hiển thị loading toàn cục trong lúc request chạy. Mặc định không.
  static const String showLoading = 'showLoading';

  /// `true` → KHÔNG tự hiển thị toast lỗi khi request fail (page tự xử lý).
  /// Mặc định (không set) sẽ hiển thị toast lỗi.
  static const String skipError = 'skipError';
}