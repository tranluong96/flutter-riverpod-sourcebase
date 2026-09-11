import 'dart:convert';
import 'package:logger/logger.dart';

class MultilinePrettyPrinter extends LogPrinter {
  MultilinePrettyPrinter({this.maxWidth = 120});

  final int maxWidth;

  @override
  List<String> log(LogEvent event) {
    final String level = _levelEmoji(event.level);
    final String message = _stringify(event.message);

    final List<String> lines = <String>[];

    lines.add('╔════════════════════════════════════════════════');
    lines.add('║ $level ${event.level.name.toUpperCase()}');
    lines.addAll(message.split('\n').map((e) => '║  $e'));
    lines.add('╚════════════════════════════════════════════════');

    return lines;
  }

  String _stringify(dynamic data) {
    if (data is Map || data is Iterable) {
      return const JsonEncoder.withIndent('  ').convert(data);
    }
    return data.toString();
  }

  String _levelEmoji(Level level) {
    switch (level) {
      case Level.error:
        return '❌';
      case Level.warning:
        return '⚠️';
      case Level.info:
        return 'ℹ️';
      case Level.debug:
        return '🐛';
      case Level.trace:
        return '🔍';
      case Level.fatal:
        return '💀';
      default:
        return '📦';
    }
  }
}
