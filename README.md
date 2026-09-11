# Flutter Riverpod Sourcebase

A cross-platform Flutter starter app using Riverpod. The current UI is a
functional showcase of shared app components rather than a complete
authentication or product workflow.

## What is included

- Riverpod state management and dependency injection.
- AutoRoute navigation with splash, onboarding, app shell, and bottom tabs.
- A Home tab demonstrating environment display, language selection, network
  status, loading overlay, dialogs, a text field, and toast styles.
- A Settings tab with language selection and placeholder account actions.
- Japanese (`ja`) and English (`en`) translations managed by Slang.
- Shared UI components, app resources, network monitoring, and local
  preferences.
- Dio and Retrofit setup, Firebase/FCM service code, and platform Firebase
  configuration files.

Some screens and services are scaffolding: the API client has no endpoints,
the onboarding buttons do not authenticate, logout currently does not
navigate, and the Firebase/FCM initialization calls in `main.dart` are
commented out. Configure and connect these flows before relying on them in a
production app.

## Project structure

```text
lib/
├── main.dart                 # Shared startup and default production entry
├── flavors/                  # Development and QA entry points
├── app/
│   ├── core/                 # Enums, extensions, resources
│   ├── helpers/              # Formatting, validation, vibration helpers
│   ├── providers/            # App-wide providers
│   ├── routers/              # AutoRoute configuration and generated routes
│   └── utils/                # Language, network, and error utilities
│   └── configs/                  # Environment, constants, and regex config
├── data/
│   ├── models/               # API and device data models
│   └── services/             # API, device info, preferences, push notifications
├── domain/
│   ├── entities/
│   └── repositories/         # Domain repository contracts
├── presentation/
│   ├── main/                 # Home, bottom bar, and settings tabs
│   ├── onboarding/
│   ├── shell/
│   ├── splash/
│   └── widgets/              # Shared buttons, inputs, dialogs, toasts, etc.
├── gen/                      # Generated asset and font references
└── i18n/                     # Translation JSON and generated Slang code
```

Generated files (for example `*.g.dart`, `*.freezed.dart`, and generated
routes) should not be edited by hand. Update their source files and regenerate
them instead.

## Requirements

- Flutter with a Dart SDK satisfying `^3.13.1` from `pubspec.yaml`.
- Android Studio for Android development and Xcode/CocoaPods for iOS
  development.

## Setup

Install dependencies:

```bash
flutter pub get
```

The app loads one environment file at startup. Copy `.env.template` to each
file below and set the `URL` value for the corresponding environment:

```text
.env       # Production; used by lib/main.dart
.env.dev   # Development; used by lib/flavors/main_dev.dart
.env.qa    # QA; used by lib/flavors/main_qa.dart
```

These files are ignored by Git. Do not commit credentials or secrets.

## Run

List available devices:

```bash
flutter devices
```

Run the default production entry point:

```bash
flutter run
```

Run the development or QA entry point:

```bash
flutter run --target lib/flavors/main_dev.dart
flutter run --target lib/flavors/main_qa.dart
```

The `dev`, `qa`, and `prod` enum values select `.env.dev`, `.env.qa`, and
`.env`, respectively. They are entry-point/environment selections; use
platform-specific build configuration separately if you need distinct native
application IDs or store variants.

## Code generation

Generate Retrofit, Riverpod, Freezed, AutoRoute, and other generated files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Regenerate translations after editing `lib/i18n/*.i18n.json`:

```bash
dart run slang
```

For continuous translation generation:

```bash
dart run slang watch
```

The base locale is Japanese, and the supported locales are Japanese and
English. Edit the JSON translation files rather than generated Dart files.

## Checks

```bash
flutter analyze
flutter test
```

There are currently no `*_test.dart` test files in the repository. Add tests
under the top-level `test/` directory as features are implemented.

## Version

The current package version is `1.0.0+1` (`1.0.0` app version, build number
`1`), as specified in `pubspec.yaml`.

## References

- [Flutter documentation](https://docs.flutter.dev/)
- [Dart documentation](https://dart.dev/guides)
- [Riverpod](https://riverpod.dev/)
- [AutoRoute](https://pub.dev/packages/auto_route)
- [Dio](https://pub.dev/packages/dio)
- [Retrofit for Dart](https://pub.dev/packages/retrofit)
- [Slang](https://pub.dev/packages/slang)
- [Firebase for Flutter](https://firebase.google.com/docs/flutter/setup)
