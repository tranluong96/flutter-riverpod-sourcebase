import 'package:intl/intl.dart';
import 'package:myapp/i18n/strings.g.dart';

String get _localeTag => LocaleSettings.currentLocale.languageTag;

/// Formats [DateTime] values using the currently selected app locale.
extension LocalizedDateTimeExt on DateTime {
  String get localizedDate => DateFormat.yMd(_localeTag).format(this);
  String get localizedFullDate => DateFormat.yMMMMd(_localeTag).format(this);
  String get localizedShortDate => DateFormat.yMMMd(_localeTag).format(this);
  String get localizedDayMonth => DateFormat.Md(_localeTag).format(this);
  String get localizedDayMonthName => DateFormat.MMMd(_localeTag).format(this);
  String get localizedMonthYear => DateFormat.yMMMM(_localeTag).format(this);
  String get localizedWeekdayDate => DateFormat.yMMMEd(_localeTag).format(this);
  String get localizedWeekday => DateFormat.EEEE(_localeTag).format(this);
  String get localizedWeekdayShort => DateFormat.E(_localeTag).format(this);

  String get localizedTime => DateFormat.jm(_localeTag).format(this);
  String get localizedTime24 => DateFormat.Hm(_localeTag).format(this);
  String get localizedTimeSeconds => DateFormat.jms(_localeTag).format(this);

  String get localizedDateTime =>
      DateFormat.yMd(_localeTag).add_jm().format(this);
}

/// Formats used for stable API and file names, independent of the app locale.
extension FixedDateTimeFormatExt on DateTime {
  String get apiDate => DateFormat('yyyy-MM-dd', 'en_US').format(this);

  String get fileStamp => DateFormat('yyyyMMdd_HHmmss', 'en_US').format(this);
}
