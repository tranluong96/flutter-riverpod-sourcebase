import 'package:intl/intl.dart';

extension DateTimeUtcExtension on DateTime {
  /// 00:00:00 local -> UTC ISO
  String get startOfDayUtc {
    final localStart = DateTime(year, month, day);
    return localStart.toUtc().toIso8601String();
  }

  /// 23:59:59.999 local -> UTC ISO
  String get endOfDayUtc {
    final localEnd = DateTime(year, month, day, 23, 59, 59, 999);
    return localEnd.toUtc().toIso8601String();
  }
}

extension NullableDateTimeExt on DateTime? {
  /// Format: yyyy年M月d日. Returns '' if null.
  String get toJpBirthday {
    if (this == null) return '';
    return DateFormat('yyyy年M月d日').format(this!);
  }

  /// Format: yyyy年M月d日. Returns '' if null.
  String get toJpFullDate {
    if (this == null) return '';
    return DateFormat('yyyy年M月d日', 'ja_JP').format(this!);
  }
}

/// Japanese-locale formatting for a [DateTime] value.
extension JpDateTimeExt on DateTime {
  String get jpDate => DateFormat('yyyy/MM/dd', 'ja_JP').format(this);
  String get jpTime => DateFormat('HH:mm', 'ja_JP').format(this);
  String get jpDateTime => DateFormat('yyyy/MM/dd HH:mm', 'ja_JP').format(this);

  /// "今日 - HH:mm" / "昨日 - HH:mm" / "yyyy年M月d日 - HH:mm".
  String get formatNotification {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateToCheck = DateTime(year, month, day);

    final time = DateFormat('HH:mm').format(this);

    if (dateToCheck == today) {
      return '今日 - $time';
    } else if (dateToCheck == yesterday) {
      return '昨日 - $time';
    } else {
      return '${DateFormat('yyyy年M月d日').format(this)} - $time';
    }
  }
}

/// Japanese-locale formatting for an ISO-8601 date [String].
extension JpStringDateExt on String {
  String get jpDate =>
      DateFormat('yyyy/MM/dd', 'ja_JP').format(DateTime.parse(this));
  String get jpTime =>
      DateFormat('HH:mm', 'ja_JP').format(DateTime.parse(this));
  String get jpDateTime =>
      DateFormat('yyyy/MM/dd HH:mm', 'ja_JP').format(DateTime.parse(this));

  /// Parse as UTC then convert to local time → "2026/01/18 12:10"
  String get toLocalDateTime {
    final utc = DateTime.parse(this).toUtc();
    final local = utc.toLocal();
    return DateFormat('yyyy/M/d HH:mm').format(local);
  }
}
