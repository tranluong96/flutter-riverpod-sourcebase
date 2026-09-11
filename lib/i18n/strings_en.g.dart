///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key) ?? super[key];

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override String get app_name => 'Flutter Riverpod Base';
	@override late final _Translations$error$en error = _Translations$error$en._(_root);
	@override String get hello => 'Hello world!';
	@override String get welcome => 'Welcome';
	@override late final _Translations$network$en network = _Translations$network$en._(_root);
	@override late final _Translations$common$en common = _Translations$common$en._(_root);
	@override late final _Translations$bottombar$en bottombar = _Translations$bottombar$en._(_root);
}

// Path: error
class _Translations$error$en extends Translations$error$ja {
	_Translations$error$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get server_error => 'Server Error';
	@override String get unknown_error => 'Unknown Error';
}

// Path: network
class _Translations$network$en extends Translations$network$ja {
	_Translations$network$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get disconnected => 'No internet connection. Please check your network.';
	@override String get reconnected => 'Back online.';
}

// Path: common
class _Translations$common$en extends Translations$common$ja {
	_Translations$common$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get ok => 'OK';
	@override String get cancel => 'Cancel';
	@override String get confirm => 'Confirm';
	@override String get close => 'Close';
	@override String get delete => 'Delete';
	@override String get save => 'Save';
	@override String get detail => 'Detail';
	@override String get language => 'Language';
	@override String get logout => 'Logout';
	@override String get deleted_account => 'Delete Account';
}

// Path: bottombar
class _Translations$bottombar$en extends Translations$bottombar$ja {
	_Translations$bottombar$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get setting => 'Setting';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app_name' => 'Flutter Riverpod Base',
			'error.server_error' => 'Server Error',
			'error.unknown_error' => 'Unknown Error',
			'hello' => 'Hello world!',
			'welcome' => 'Welcome',
			'network.disconnected' => 'No internet connection. Please check your network.',
			'network.reconnected' => 'Back online.',
			'common.ok' => 'OK',
			'common.cancel' => 'Cancel',
			'common.confirm' => 'Confirm',
			'common.close' => 'Close',
			'common.delete' => 'Delete',
			'common.save' => 'Save',
			'common.detail' => 'Detail',
			'common.language' => 'Language',
			'common.logout' => 'Logout',
			'common.deleted_account' => 'Delete Account',
			'bottombar.home' => 'Home',
			'bottombar.setting' => 'Setting',
			_ => null,
		};
	}
}
