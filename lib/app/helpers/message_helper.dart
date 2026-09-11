class MessageHelper {
  MessageHelper._();

  /// COMMON
  static const String serverError = 'サーバーエラーが発生しました。';

  static const String connectTimeout = '接続がタイムアウトしました。';

  static const String sendingTimeout = '送信がタイムアウトしました。';

  static const String receiveTimeout = '受信がタイムアウトしました。';

  static const String badCertificate = '不正な証明書です。';

  static const String badResponse = '不正なレスポンスです。';

  static const String cancelRequest = 'リクエストがキャンセルされました。';

  static const String connectionError = '接続エラーが発生しました。';

  static const String unknown = '不明なエラーが発生しました。';

  static const String internetDisconnected = '通信エラーが発生しました。';

  static const String sessionExpired = 'セッションの有効期限が切れました。再度ログインしてください。';

  static const String retrieveError = '情報の取得に失敗しました。';

  /// VALIDATION
  static const String requiredEnterField = 'は必須項目です。';

  static const String nameRequired = 'お名前を入力してください。';

  static const String kanaFormatInvalid = 'ふりがなはひらがな・カタカナで入力してください。';

  static const String nameFormatInvalid = '氏名は全角漢字・ローマ字で入力してください。';

  static const String bodyTempInvalid = '正しい体温を入力してください。';

  static const String emailRequired = 'メールアドレスは必須項目です。';

  static const String emailFormatInvalid = '正しいメールアドレスの形式で入力してください。';

  static const String phoneFormatInvalid = '電話番号は10〜11桁で入力してください。';

  static const String postalCodeFormatInvalid = '郵便番号は7桁で入力してください。';

  static const String passwordRequired = 'パスワードは必須項目です。';

  static const String passwordFormatInvalid = '半角英数字8文字以上で入力してください';

  static const String passwordConfirmRequired = 'パスワード（確認用）は必須項目です。';

  static const String passwordConfirmNotMatch = 'パスワードが一致しません。';

  static const String expiryDateRequired = '有効期限は必須項目です。';

  static const String expiryDateFormatInvalid = '有効期限の形式が正しくありません。';

  static const String monthInvalid = '月が正しくありません。';

  static const String cardExpired = 'カードの有効期限が切れています。';

  /// AUTH
  static const String requestFailed = '失敗しました。';

  static const String loginFailed = 'ログインに失敗しました。';

  static const String lineLoginUnavailable = 'LINEログインは現在ご利用いただけません。';

  /// APP
  static const String logoutSuccess = 'ログアウトしました。';

  static const String deletedSuccess = 'アカウントを削除しました。';
}
