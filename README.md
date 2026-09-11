# myapp

## 1. Summary

`myapp` is a cross-platform Flutter application with Japanese as its base
locale. The application currently includes:

- State management and dependency injection with Riverpod.
- Navigation with AutoRoute.
- API communication with Dio and Retrofit.
- Local storage with SharedPreferences and Hive.
- Firebase Core, Cloud Messaging, and Crashlytics.
- Deep links, local notifications, QR/barcode scanning, and network status checks.
- Localization with Slang; the primary font is `NotoSansJP`.

## 2. Architecture

The project uses a feature-first structure combined with shared application modules:

```text
lib/
├── main.dart                 # Entry point, bootstrap, and error handlers
├── app/
│   ├── base/                 # Base classes and shared conventions
│   ├── configs/              # Application configuration
│   ├── core/                 # Network, storage, services, extensions, resources
│   ├── language/             # Language state and logic
│   ├── routers/              # AppRouter and route definitions
│   └── widgets/              # Shared widgets, overlays, loading, and toast
├── data/
│   ├── local/                # Local data sources
│   ├── models/               # Data models
│   └── remote/               # Remote data sources and API
├── feature/
│   ├── auth/                 # Authentication
│   ├── main/                 # Home, app shell, settings...
│   ├── onboarding_page.dart
│   └── splash_page.dart
└── i18n/                     # Translation files and Slang-generated code
```

Main startup flow:

1. `main.dart` initializes the Flutter binding and error handlers.
2. The environment file, SharedPreferences, and Hive are initialized.
3. `ProviderContainer`, deep links, and the language provider are initialized.
4. `MyApp` runs inside `UncontrolledProviderScope` and `TranslationProvider`.

## 3. CLI config and setup

### Requirements

- Flutter compatible with Dart SDK `^3.13.1`.
- Android Studio or Xcode, depending on the target platform.
- CocoaPods for iOS/macOS development.
- Firebase CLI/FlutterFire CLI if Firebase configuration needs to be regenerated.

### Installation

```bash
fvm flutter pub get
```

Create a `.env` file before running the application. `main.dart` currently
calls `dotenv.load(fileName: '.env')` directly. The `AppFlavor` enum defines
mappings for `.env`, `.env.stg`, and `.env.prod`, but flavor-based file selection
is not currently connected to the entry point. Check all required environment
variables and do not commit secrets.

Generate code for Retrofit, Freezed, Riverpod, and other generators:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Generate or watch translation files:

```bash
dart run slang
# Watch for changes during development:
dart run slang watch
```

Native Firebase configuration is stored in `android/app/google-services.json`
and `ios/Runner/GoogleService-Info.plist`. Regenerate the Dart configuration with:

```bash
flutterfire configure
```

## 4. Run

List available devices and emulators:

```bash
flutter devices
```

Run the app in debug mode:

```bash
flutter run
```

Run on a specific device:

```bash
flutter run -d <device-id>
```

Common build commands:

```bash
flutter build apk --debug
flutter build appbundle --release
flutter build ios --release
```

The `development`, `staging`, and `production` flavors are defined in
`AppFlavor`. However, the entry point currently calls
`mainCommon(AppFlavor.production)` by default. To run another flavor, update
the entry point or add a flavor-selection mechanism before using flavor-specific
build commands.

Run checks:

```bash
flutter analyze
flutter test
```

## 5. Version noted

Current version information from `pubspec.yaml`:

| Component | Value |
| --- | --- |
| App version | `1.0.0` |
| Build number | `1` |
| Dart SDK constraint | `^3.13.1` |
| Flutter package | `flutter` |

Flutter Version
| Component | Value |
| --- | --- |
| Flutter | 3.47.1 • channel stable • https://github.com/flutter/flutter.git  | 
| Framework | revision 6655482ec0 (3 weeks ago) • 2026-08-19 10:07:23 -0700 | 
| Engine | hash 11d79658c444477b06513d32b52c8c4ccb7276b0 (revision 5d53178869) (23 days ago) 2026-08-18 23:36:01.000Z | 
| Tools | Dart 3.13.1 • DevTools 2.60.0| 

The build version can be overridden during the build:

```bash
flutter build apk --build-name=1.0.0 --build-number=1
```

## 6. Sources

- [Flutter documentation](https://docs.flutter.dev/)
- [Dart documentation](https://dart.dev/guides)
- [Riverpod](https://riverpod.dev/)
- [AutoRoute](https://pub.dev/packages/auto_route)
- [Dio](https://pub.dev/packages/dio)
- [Retrofit for Dart](https://pub.dev/packages/retrofit)
- [Slang](https://pub.dev/packages/slang)
- [Firebase for Flutter](https://firebase.google.com/docs/flutter/setup)
