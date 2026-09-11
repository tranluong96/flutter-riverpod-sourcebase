/// Keys used in `RequestOptions.extra` to enable/disable global UI behavior
/// on a per-request basis (read by [GlobalUiInterceptor]).
///
/// Usage with retrofit:
/// ```dart
/// @Extra({ApiExtraKeys.skipLoading: true})
/// @POST(APPEndpoints.loginAPI)
/// Future<UserOutput> loginAPI(@Body() LoginInput input);
/// ```
/// Or pass it dynamically via `Options(extra: {ApiExtraKeys.skipError: true})`.
abstract class ExtraKeys {
  /// `true` → hiden the global loading indicator while the request is running.
  /// Defaults to off.
  static const String skipLoading = 'skipLoading';

  /// `true` → do NOT automatically show an error toast when the request fails
  /// (the page handles the error itself).
  /// By default (when not set), an error toast is shown.
  static const String skipError = 'skipError';
}