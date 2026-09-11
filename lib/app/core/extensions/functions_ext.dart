import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FunctionExt {
  static Future<void> clearCacheOnStartup() async {
    try {
      final tempDir = await getTemporaryDirectory();
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    } catch (e) {
      // Do nothing if an error occurs while clearing the cache
    }
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
