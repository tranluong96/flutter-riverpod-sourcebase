import 'package:intl/intl.dart';

extension NumPriceExt on num {
  /// Drops the decimal part for whole numbers ("10"), keeps it otherwise ("10.5").
  String get formatPrice =>
      this == truncate() ? truncate().toString() : toString();
}

extension JPCurrencyExt on num {
  /// Japanese yen formatting, e.g. 1500 → "¥1,500".
  String get jpy {
    final formatter = NumberFormat.currency(
      locale: 'ja_JP',
      symbol: '¥',
      decimalDigits: 0,
    );
    return formatter.format(this);
  }
}
