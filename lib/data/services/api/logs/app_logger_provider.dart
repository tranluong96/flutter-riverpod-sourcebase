import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:myapp/data/services/api/logs/app_logger.dart';

final appLoggerProvider = Provider<Logger>((ref) {
  return Logger(printer: MultilinePrettyPrinter(), level: Level.debug);
});
