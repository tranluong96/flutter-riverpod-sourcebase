///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsJa = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// ja: 'Flutter Riverpod Base'
	String get app_name => 'Flutter Riverpod Base';

	late final Translations$error$ja error = Translations$error$ja.internal(_root);

	/// ja: 'こんにちは世界'
	String get hello => 'こんにちは世界';

	/// ja: 'ようこそ'
	String get welcome => 'ようこそ';

	late final Translations$network$ja network = Translations$network$ja.internal(_root);
	late final Translations$date$ja date = Translations$date$ja.internal(_root);
	late final Translations$message$ja message = Translations$message$ja.internal(_root);
	late final Translations$validation$ja validation = Translations$validation$ja.internal(_root);
	late final Translations$common$ja common = Translations$common$ja.internal(_root);
	late final Translations$app_update$ja app_update = Translations$app_update$ja.internal(_root);
	late final Translations$bottombar$ja bottombar = Translations$bottombar$ja.internal(_root);
}

// Path: error
class Translations$error$ja {
	Translations$error$ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'サーバーエラー'
	String get server_error => 'サーバーエラー';

	/// ja: '不明なエラー'
	String get unknown_error => '不明なエラー';
}

// Path: network
class Translations$network$ja {
	Translations$network$ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'インターネットに接続できません。通信環境をご確認ください。'
	String get disconnected => 'インターネットに接続できません。通信環境をご確認ください。';

	/// ja: 'インターネットに接続されました。'
	String get connected => 'インターネットに接続されました。';
}

// Path: date
class Translations$date$ja {
	Translations$date$ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '今日'
	String get today => '今日';

	/// ja: '昨日'
	String get yesterday => '昨日';
}

// Path: message
class Translations$message$ja {
	Translations$message$ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'サーバーエラーが発生しました。'
	String get server_error => 'サーバーエラーが発生しました。';

	/// ja: '接続がタイムアウトしました。'
	String get connect_timeout => '接続がタイムアウトしました。';

	/// ja: '送信がタイムアウトしました。'
	String get sending_timeout => '送信がタイムアウトしました。';

	/// ja: '受信がタイムアウトしました。'
	String get receive_timeout => '受信がタイムアウトしました。';

	/// ja: '不正な証明書です。'
	String get bad_certificate => '不正な証明書です。';

	/// ja: '不正なレスポンスです。'
	String get bad_response => '不正なレスポンスです。';

	/// ja: 'リクエストがキャンセルされました。'
	String get cancel_request => 'リクエストがキャンセルされました。';

	/// ja: '接続エラーが発生しました。'
	String get connection_error => '接続エラーが発生しました。';

	/// ja: '不明なエラーが発生しました。'
	String get unknown => '不明なエラーが発生しました。';

	/// ja: '通信エラーが発生しました。'
	String get internet_disconnected => '通信エラーが発生しました。';

	/// ja: 'セッションの有効期限が切れました。再度ログインしてください。'
	String get session_expired => 'セッションの有効期限が切れました。再度ログインしてください。';

	/// ja: '情報の取得に失敗しました。'
	String get retrieve_error => '情報の取得に失敗しました。';

	/// ja: '失敗しました。'
	String get request_failed => '失敗しました。';

	/// ja: 'ログインに失敗しました。'
	String get login_failed => 'ログインに失敗しました。';

	/// ja: 'ログアウトしました。'
	String get logout_success => 'ログアウトしました。';

	/// ja: 'アカウントを削除しました。'
	String get deleted_success => 'アカウントを削除しました。';
}

// Path: validation
class Translations$validation$ja {
	Translations$validation$ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '{name}は必須項目です。'
	String required_field({required Object Name}) => '${Name}は必須項目です。';

	/// ja: 'この項目は必須です。'
	String get field_required => 'この項目は必須です。';

	/// ja: 'お名前を入力してください。'
	String get name_required => 'お名前を入力してください。';

	/// ja: 'ふりがなはひらがな・カタカナで入力してください。'
	String get kana_format_invalid => 'ふりがなはひらがな・カタカナで入力してください。';

	/// ja: '氏名は全角漢字・ローマ字で入力してください。'
	String get name_format_invalid => '氏名は全角漢字・ローマ字で入力してください。';

	/// ja: 'メールアドレスは必須項目です。'
	String get email_required => 'メールアドレスは必須項目です。';

	/// ja: '正しいメールアドレスの形式で入力してください。'
	String get email_format_invalid => '正しいメールアドレスの形式で入力してください。';

	/// ja: '電話番号は10〜11桁で入力してください。'
	String get phone_format_invalid => '電話番号は10〜11桁で入力してください。';

	/// ja: '郵便番号は7桁で入力してください。'
	String get postal_code_format_invalid => '郵便番号は7桁で入力してください。';

	/// ja: 'パスワードは必須項目です。'
	String get password_required => 'パスワードは必須項目です。';

	/// ja: '半角英数字8文字以上で、英字と数字を含めて入力してください。'
	String get password_format_invalid => '半角英数字8文字以上で、英字と数字を含めて入力してください。';

	/// ja: 'パスワード（確認用）は必須項目です。'
	String get password_confirm_required => 'パスワード（確認用）は必須項目です。';

	/// ja: 'パスワードが一致しません。'
	String get password_confirm_not_match => 'パスワードが一致しません。';
}

// Path: common
class Translations$common$ja {
	Translations$common$ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'OK'
	String get ok => 'OK';

	/// ja: 'キャンセル'
	String get cancel => 'キャンセル';

	/// ja: '確認'
	String get confirm => '確認';

	/// ja: '閉じる'
	String get close => '閉じる';

	/// ja: '削除'
	String get delete => '削除';

	/// ja: '保存'
	String get save => '保存';

	/// ja: '詳細へ'
	String get detail => '詳細へ';

	/// ja: '言語'
	String get language => '言語';

	/// ja: 'ログアウト'
	String get logout => 'ログアウト';

	/// ja: 'アカウント削除'
	String get deleted_account => 'アカウント削除';
}

// Path: app_update
class Translations$app_update$ja {
	Translations$app_update$ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$app_update$force$ja force = Translations$app_update$force$ja.internal(_root);
	late final Translations$app_update$optional$ja optional = Translations$app_update$optional$ja.internal(_root);

	/// ja: 'スキップ'
	String get skip => 'スキップ';

	/// ja: 'アップデート'
	String get update => 'アップデート';
}

// Path: bottombar
class Translations$bottombar$ja {
	Translations$bottombar$ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ホーム'
	String get home => 'ホーム';

	/// ja: '設定'
	String get setting => '設定';
}

// Path: app_update.force
class Translations$app_update$force$ja {
	Translations$app_update$force$ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '現在お使いのバージョンはサポート対象外です。'
	String get title => '現在お使いのバージョンはサポート対象外です。';

	/// ja: 'アプリを引き続きご利用いただくには、アップデートしてください。'
	String get message => 'アプリを引き続きご利用いただくには、アップデートしてください。';
}

// Path: app_update.optional
class Translations$app_update$optional$ja {
	Translations$app_update$optional$ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'アプリの新しいバージョンが利用可能になりました。'
	String get title => 'アプリの新しいバージョンが利用可能になりました。';

	/// ja: 'より快適な体験と新機能へのアクセスをご希望の場合は、今すぐアップデートしてください。'
	String get message => 'より快適な体験と新機能へのアクセスをご希望の場合は、今すぐアップデートしてください。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app_name' => 'Flutter Riverpod Base',
			'error.server_error' => 'サーバーエラー',
			'error.unknown_error' => '不明なエラー',
			'hello' => 'こんにちは世界',
			'welcome' => 'ようこそ',
			'network.disconnected' => 'インターネットに接続できません。通信環境をご確認ください。',
			'network.connected' => 'インターネットに接続されました。',
			'date.today' => '今日',
			'date.yesterday' => '昨日',
			'message.server_error' => 'サーバーエラーが発生しました。',
			'message.connect_timeout' => '接続がタイムアウトしました。',
			'message.sending_timeout' => '送信がタイムアウトしました。',
			'message.receive_timeout' => '受信がタイムアウトしました。',
			'message.bad_certificate' => '不正な証明書です。',
			'message.bad_response' => '不正なレスポンスです。',
			'message.cancel_request' => 'リクエストがキャンセルされました。',
			'message.connection_error' => '接続エラーが発生しました。',
			'message.unknown' => '不明なエラーが発生しました。',
			'message.internet_disconnected' => '通信エラーが発生しました。',
			'message.session_expired' => 'セッションの有効期限が切れました。再度ログインしてください。',
			'message.retrieve_error' => '情報の取得に失敗しました。',
			'message.request_failed' => '失敗しました。',
			'message.login_failed' => 'ログインに失敗しました。',
			'message.logout_success' => 'ログアウトしました。',
			'message.deleted_success' => 'アカウントを削除しました。',
			'validation.required_field' => ({required Object Name}) => '${Name}は必須項目です。',
			'validation.field_required' => 'この項目は必須です。',
			'validation.name_required' => 'お名前を入力してください。',
			'validation.kana_format_invalid' => 'ふりがなはひらがな・カタカナで入力してください。',
			'validation.name_format_invalid' => '氏名は全角漢字・ローマ字で入力してください。',
			'validation.email_required' => 'メールアドレスは必須項目です。',
			'validation.email_format_invalid' => '正しいメールアドレスの形式で入力してください。',
			'validation.phone_format_invalid' => '電話番号は10〜11桁で入力してください。',
			'validation.postal_code_format_invalid' => '郵便番号は7桁で入力してください。',
			'validation.password_required' => 'パスワードは必須項目です。',
			'validation.password_format_invalid' => '半角英数字8文字以上で、英字と数字を含めて入力してください。',
			'validation.password_confirm_required' => 'パスワード（確認用）は必須項目です。',
			'validation.password_confirm_not_match' => 'パスワードが一致しません。',
			'common.ok' => 'OK',
			'common.cancel' => 'キャンセル',
			'common.confirm' => '確認',
			'common.close' => '閉じる',
			'common.delete' => '削除',
			'common.save' => '保存',
			'common.detail' => '詳細へ',
			'common.language' => '言語',
			'common.logout' => 'ログアウト',
			'common.deleted_account' => 'アカウント削除',
			'app_update.force.title' => '現在お使いのバージョンはサポート対象外です。',
			'app_update.force.message' => 'アプリを引き続きご利用いただくには、アップデートしてください。',
			'app_update.optional.title' => 'アプリの新しいバージョンが利用可能になりました。',
			'app_update.optional.message' => 'より快適な体験と新機能へのアクセスをご希望の場合は、今すぐアップデートしてください。',
			'app_update.skip' => 'スキップ',
			'app_update.update' => 'アップデート',
			'bottombar.home' => 'ホーム',
			'bottombar.setting' => '設定',
			_ => null,
		};
	}
}
