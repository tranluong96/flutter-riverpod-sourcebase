import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/app/core/enums/enums.dart';
import 'package:myapp/app/core/extensions/function_ext.dart';
import 'package:myapp/app/core/prefs/app_prefs.dart';
import 'package:myapp/app/core/services/deep_link/deep_link_service.dart';
import 'package:myapp/app/language/provider/language_provider.dart';
import 'package:myapp/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await mainCommon(AppFlavor.production);
}

Future<void> mainCommon(AppFlavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  registerErrorHandlers();

  await dotenv.load(fileName: '.env');
  await FunctionExt.clearCacheOnStartup();
  final prefs = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
  );

  // Local database
  await Hive.initFlutter();

  // final fcmService = container.read(fcmServiceProvider);
  // await fcmService.init();
  // await fcmService.requestPermission();
  // container.read(fcmControllerProvider);

  // Initialize DeepLink Service
  final deepLinkService = container.read(deepLinkServiceProvider);
  await deepLinkService.init();

  // Init language state
  container.read(languageProvider);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
        runApp(
          UncontrolledProviderScope(
            container: container,
            child: TranslationProvider(child: const MyApp()),
          ),
        );
      });
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    FlutterError.presentError(
      FlutterErrorDetails(exception: error, stack: stack),
    );
    debugPrint('$error\n$stack');
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('An error occurred'),
      ),
      body: SafeArea(child: Center(child: Text(details.toString()))),
    );
  };
}
