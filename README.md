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

The app follows layered MVVM with Riverpod. `presentation/` contains Views,
ViewModels, UI state, and shared widgets; `data/` contains models and repositories.
Cross-cutting infrastructure such as networking, preferences, Firebase services,
navigation, and localization remains in `app/`.

```text
lib/
├── main.dart
├── app/
│   ├── core/                 # Network, preferences, platform services, resources
│   ├── language/             # App-wide language state
│   ├── routers/              # AutoRoute configuration and generated routes
│   └── app.dart              # Root app composition and global UI event handling
├── data/
│   ├── models/               # API and app data models
│   └── repositories/         # AppRepository, SessionRepository
├── presentation/
│   ├── home/                 # views/, view_models/, widgets/
│   ├── onboarding/views/
│   ├── setting/              # views/, view_models/, widgets/
│   ├── shell/                # views/, view_models/, widgets/
│   ├── splash/               # views/, view_models/
│   └── widgets/              # Shared buttons, inputs, dialogs, overlays
├── gen/                      # Generated asset/font references
└── i18n/                     # Slang translations and generated code
```

Each screen keeps its UI in `views/`, its presentation logic in `view_models/`,
and immutable Freezed state alongside its ViewModel. Small, short-lived widget
state can remain local instead of becoming a provider.

### Dependency direction

```text
View -> ViewModel -> Repository -> app/core infrastructure
```

Views watch state and send user actions to ViewModels. ViewModels obtain data or
perform app actions through repository providers. Repositories coordinate the
underlying preferences and platform services. Shared UI belongs in
`presentation/widgets/`; `app/core` stays independent of presentation code.
Global network errors are published as app-level events and rendered as toast
UI by the root app. Shell-level network and deep-link handling remains in the
shell presentation.

`HomeViewModel`, `SettingViewModel`, and `AppShellViewModel` use explicit
`NotifierProvider`s. Other infrastructure and generated models may use code
generation. Do not edit generated files by hand.

### Startup flow

1. `main.dart` initializes the Flutter binding and error handlers.
2. The environment file, SharedPreferences, and Hive are initialized.
3. `ProviderContainer`, deep links, and the language provider are initialized.
4. `MyApp` runs inside `UncontrolledProviderScope` and `TranslationProvider`.

```mermaid
flowchart LR
    Bootstrap["main.dart"] --> Root["MyApp"]
    Root --> View["View"]
    View -->|watch state / send action| VM["ViewModel"]
    VM -->|read provider| Repo["Repository"]
    Repo --> Infra["app/core services and storage"]
    Infra -. "network error event" .-> Root
```

### Testing

Unit tests are recommended for ViewModel state transitions, repository behavior,
error handling, and data mapping. Override repository providers with fakes so
tests do not make real network calls. For example, the initial home state can be
checked without building a widget:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/presentation/home/view_models/home_view_model.dart';

void main() {
  test('starts with loading state and no products', () {
    final container = ProviderContainer.test();

    final state = container.read(homeViewModelProvider);

    expect(state.isLoading, isTrue);
    expect(state.products, isEmpty);
  });
}
```

`ProviderContainer.test()` disposes the container after the test. Widget and
integration tests are still needed for navigation, rendering, and native plugin
behavior.

### Lifecycle and memory leaks

- Prefer auto-disposed providers; use `keepAlive` only when there is a clear reason.
- Dispose subscriptions, timers, controllers, sockets, and owned resources with `ref.onDispose`.
- Use `ref.watch`/`ref.listen` within provider or UI lifecycles; do not register subscriptions repeatedly in `build`.
- Cancel requests when a provider is disposed if supported; do not retain `BuildContext` or widgets in singletons.
- Dispose `ProviderContainer` instances in tests and dispose manually created containers when their owner ends.

`NetworkController` demonstrates cancelling subscriptions with `ref.onDispose`.
The app container is created once in `mainCommon()` and owned by
`UncontrolledProviderScope` for the application's lifetime.

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
