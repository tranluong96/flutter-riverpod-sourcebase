import 'package:mocktail/mocktail.dart';
import 'package:myapp/data/services/prefs_local_storage/app_prefs.dart';
import 'package:myapp/data/services/push_notification/fcm_service.dart';

class MockPrefsLocalStorage extends Mock implements PrefsLocalStorage {}

class MockFCMService extends Mock implements FCMService {}
