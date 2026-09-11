enum ToastStatus {
  information,
  success,
  warning,
  error;

  bool get isSuccess => this == ToastStatus.success;
  bool get isInformation => this == ToastStatus.information;
  bool get isWarning => this == ToastStatus.warning;
}

enum NetworkStatus {
  online,
  offline,
  unknown;

  bool get isDisConnection => this == NetworkStatus.offline;
}

enum AppFlavor {
  dev,
  qa,
  prod;

  bool get isDevelopment => this == AppFlavor.dev;
  bool get isQa => this == AppFlavor.qa;
  bool get isProduction => this == AppFlavor.prod;

  // env
  String get envFileName {
    return switch (this) {
      AppFlavor.dev => '.env.dev',
      AppFlavor.qa => '.env.qa',
      AppFlavor.prod => '.env',
    };
  }
}

enum VibrationStatus { idle, success, error }
