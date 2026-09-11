import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/prefs/app_prefs.dart';
import 'package:myapp/app/language/state/language_state.dart';
import 'package:myapp/i18n/strings.g.dart';

class LanguageController extends Notifier<LanguageState> {
  @override
  LanguageState build() {
    final savedLocale = ref.read(appPrefsProvider).languageCode ?? 'ja';
    LocaleSettings.setLocaleRaw(savedLocale);
    return LanguageState(localeCode: savedLocale);
  }

  void changeLanguage(String localeCode) {
    LocaleSettings.setLocaleRaw(localeCode);
    ref.read(appPrefsProvider).setLanguageCode(localeCode);
    state = state.copyWith(localeCode: localeCode);
  }

  void setDefault() {
    const defaultLocale = 'ja';
    LocaleSettings.setLocaleRaw(defaultLocale);
    ref.read(appPrefsProvider).setLanguageCode(defaultLocale);
    state = state.copyWith(localeCode: defaultLocale);
  }
}
