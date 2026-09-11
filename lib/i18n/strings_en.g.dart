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
	@override late final _Translations$date$en date = _Translations$date$en._(_root);
	@override late final _Translations$message$en message = _Translations$message$en._(_root);
	@override late final _Translations$validation$en validation = _Translations$validation$en._(_root);
	@override late final _Translations$common$en common = _Translations$common$en._(_root);
	@override late final _Translations$app_update$en app_update = _Translations$app_update$en._(_root);
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
	@override String get disconnected => 'No internet connection.';
	@override String get connected => 'Online.';
}

// Path: date
class _Translations$date$en extends Translations$date$ja {
	_Translations$date$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get today => 'Today';
	@override String get yesterday => 'Yesterday';
}

// Path: message
class _Translations$message$en extends Translations$message$ja {
	_Translations$message$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get server_error => 'A server error occurred.';
	@override String get connect_timeout => 'The connection timed out.';
	@override String get sending_timeout => 'The request timed out.';
	@override String get receive_timeout => 'The response timed out.';
	@override String get bad_certificate => 'The certificate is invalid.';
	@override String get bad_response => 'The server returned an invalid response.';
	@override String get cancel_request => 'The request was cancelled.';
	@override String get connection_error => 'A connection error occurred.';
	@override String get unknown => 'An unknown error occurred.';
	@override String get internet_disconnected => 'A network error occurred.';
	@override String get session_expired => 'Your session has expired. Please log in again.';
	@override String get retrieve_error => 'Failed to retrieve information.';
	@override String get request_failed => 'The request failed.';
	@override String get login_failed => 'Login failed.';
	@override String get logout_success => 'Logged out successfully.';
	@override String get deleted_success => 'Your account was deleted successfully.';
}

// Path: validation
class _Translations$validation$en extends Translations$validation$ja {
	_Translations$validation$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String required_field({required Object Name}) => '${Name} is required.';
	@override String get field_required => 'This field is required.';
	@override String get name_required => 'Please enter your name.';
	@override String get kana_format_invalid => 'Please enter furigana using hiragana or katakana.';
	@override String get name_format_invalid => 'Please enter your name using full-width kanji or Roman letters.';
	@override String get email_required => 'Email address is required.';
	@override String get email_format_invalid => 'Please enter a valid email address.';
	@override String get phone_format_invalid => 'Please enter a 10- or 11-digit phone number.';
	@override String get postal_code_format_invalid => 'Please enter a 7-digit postal code.';
	@override String get password_required => 'Password is required.';
	@override String get password_format_invalid => 'Please enter at least 8 half-width alphanumeric characters, including both letters and numbers.';
	@override String get password_confirm_required => 'Password confirmation is required.';
	@override String get password_confirm_not_match => 'Passwords do not match.';
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

// Path: app_update
class _Translations$app_update$en extends Translations$app_update$ja {
	_Translations$app_update$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _Translations$app_update$force$en force = _Translations$app_update$force$en._(_root);
	@override late final _Translations$app_update$optional$en optional = _Translations$app_update$optional$en._(_root);
	@override String get skip => 'Skip';
	@override String get update => 'Update';
}

// Path: bottombar
class _Translations$bottombar$en extends Translations$bottombar$ja {
	_Translations$bottombar$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get setting => 'Setting';
}

// Path: app_update.force
class _Translations$app_update$force$en extends Translations$app_update$force$ja {
	_Translations$app_update$force$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Your current version is no longer supported.';
	@override String get message => 'Please update to continue using the app.';
}

// Path: app_update.optional
class _Translations$app_update$optional$en extends Translations$app_update$optional$ja {
	_Translations$app_update$optional$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'A new version of the app is available.';
	@override String get message => 'Update now for a better experience and access to new features.';
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
			'network.disconnected' => 'No internet connection.',
			'network.connected' => 'Online.',
			'date.today' => 'Today',
			'date.yesterday' => 'Yesterday',
			'message.server_error' => 'A server error occurred.',
			'message.connect_timeout' => 'The connection timed out.',
			'message.sending_timeout' => 'The request timed out.',
			'message.receive_timeout' => 'The response timed out.',
			'message.bad_certificate' => 'The certificate is invalid.',
			'message.bad_response' => 'The server returned an invalid response.',
			'message.cancel_request' => 'The request was cancelled.',
			'message.connection_error' => 'A connection error occurred.',
			'message.unknown' => 'An unknown error occurred.',
			'message.internet_disconnected' => 'A network error occurred.',
			'message.session_expired' => 'Your session has expired. Please log in again.',
			'message.retrieve_error' => 'Failed to retrieve information.',
			'message.request_failed' => 'The request failed.',
			'message.login_failed' => 'Login failed.',
			'message.logout_success' => 'Logged out successfully.',
			'message.deleted_success' => 'Your account was deleted successfully.',
			'validation.required_field' => ({required Object Name}) => '${Name} is required.',
			'validation.field_required' => 'This field is required.',
			'validation.name_required' => 'Please enter your name.',
			'validation.kana_format_invalid' => 'Please enter furigana using hiragana or katakana.',
			'validation.name_format_invalid' => 'Please enter your name using full-width kanji or Roman letters.',
			'validation.email_required' => 'Email address is required.',
			'validation.email_format_invalid' => 'Please enter a valid email address.',
			'validation.phone_format_invalid' => 'Please enter a 10- or 11-digit phone number.',
			'validation.postal_code_format_invalid' => 'Please enter a 7-digit postal code.',
			'validation.password_required' => 'Password is required.',
			'validation.password_format_invalid' => 'Please enter at least 8 half-width alphanumeric characters, including both letters and numbers.',
			'validation.password_confirm_required' => 'Password confirmation is required.',
			'validation.password_confirm_not_match' => 'Passwords do not match.',
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
			'app_update.force.title' => 'Your current version is no longer supported.',
			'app_update.force.message' => 'Please update to continue using the app.',
			'app_update.optional.title' => 'A new version of the app is available.',
			'app_update.optional.message' => 'Update now for a better experience and access to new features.',
			'app_update.skip' => 'Skip',
			'app_update.update' => 'Update',
			'bottombar.home' => 'Home',
			'bottombar.setting' => 'Setting',
			_ => null,
		};
	}
}
