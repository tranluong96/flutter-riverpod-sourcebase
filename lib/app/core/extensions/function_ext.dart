import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class FunctionExt {
  static String fomartPriceJP(double value, {bool showUnit = true}) {
    final int number = value.toInt();

    final formatter = NumberFormat.decimalPattern('en_US');

    return showUnit ? '${formatter.format(number)}円' : formatter.format(number);
  }

  static String generateRandomId(int cNum) {
    const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final random = Random.secure();

    return List.generate(
      10 + cNum,
      (_) => chars[random.nextInt(chars.length)],
    ).join();
  }

  static Future<void> clearCacheOnStartup() async {
    try {
      final tempDir = await getTemporaryDirectory();
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  static void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
}
