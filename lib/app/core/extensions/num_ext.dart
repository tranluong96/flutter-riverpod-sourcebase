
extension NumPriceExt on num {
  /// Drops the decimal part for whole numbers ("10"), keeps it otherwise ("10.5").
  String get formatPrice =>
      this == truncate() ? truncate().toString() : toString();
}
