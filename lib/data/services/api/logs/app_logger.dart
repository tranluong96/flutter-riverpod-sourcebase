import 'dart:convert';

import 'package:logger/logger.dart';

class MultilinePrettyPrinter extends LogPrinter {
  MultilinePrettyPrinter({this.maxWidth = 120});

  final int maxWidth;

  @override
  List<String> log(LogEvent event) {
    final String level = _levelEmoji(event.level);
    final String message = _stringify(event.message);
    if (message.isNotEmpty) {
      final List<String> lines = <String>[];

      lines.add('╔════════════════════════════════════════════════');
      lines.add('║ $level ${event.level.name.toUpperCase()}');
      lines.addAll(message.split('\n').map((e) => '║  $e'));
      lines.add('╚════════════════════════════════════════════════');

      return lines;
    } else {
      return [""];
    }
  }

  String _stringify(dynamic message) {
    final dynamic finalMessage = message is Function ? message() : message;

    if (finalMessage is Map || finalMessage is Iterable) {
      return _encode(finalMessage);
    }

    if (finalMessage is String) {
      final trimmed = finalMessage.trim();
      if ((trimmed.startsWith('{') && trimmed.endsWith('}')) ||
          (trimmed.startsWith('[') && trimmed.endsWith(']'))) {
        try {
          return _encode(json.decode(trimmed));
        } catch (_) {}
      }
      return finalMessage;
    }

    return finalMessage.toString();
  }

  String _encode(Object? object) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(object);
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
