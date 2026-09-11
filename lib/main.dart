import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/app/core/enums/enums.dart';
import 'package:myapp/app/core/extensions/functions_ext.dart';
import 'package:myapp/app/utils/language/language_service.dart';
import 'package:myapp/data/services/prefs_local_storage/app_prefs.dart';
import 'package:myapp/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await mainCommon(AppFlavor.prod);
}

Future<void> mainCommon(AppFlavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Env
  await dotenv.load(fileName: flavor.envFileName);

  // Clear cache on startup
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

  // Init language state
  container.read(languageServiceProvider);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
        runApp(
          UncontrolledProviderScope(
            container: container,
            child: TranslationProvider(child: const MyApp()),
          ),
        );
      });
}
