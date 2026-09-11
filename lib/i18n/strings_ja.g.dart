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
	late final Translations$common$ja common = Translations$common$ja.internal(_root);
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
	String get reconnected => 'インターネットに接続されました。';
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
			'network.reconnected' => 'インターネットに接続されました。',
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
			'bottombar.home' => 'ホーム',
			'bottombar.setting' => '設定',
			_ => null,
		};
	}
}
