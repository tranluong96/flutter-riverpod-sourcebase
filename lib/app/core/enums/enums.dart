// ignore_for_file: constant_identifier_names

enum EToastType {
  success,
  warning,
  error;

  bool get isSuccess => this == EToastType.success;
  bool get isWarning => this == EToastType.warning;
}

enum NetworkStatus {
  online,
  offline,
  unknown;

  bool get isDisConnection => this == NetworkStatus.offline;
}

enum Gender {
  female,
  male,
  other;

  static Gender fromString(String? value) {
    return switch (value?.toLowerCase()) {
      'male' => Gender.male,
      'female' => Gender.female,
      _ => Gender.other,
    };
  }

  String get label {
    return switch (this) {
      Gender.female => '女性',
      Gender.male => '男性',
      Gender.other => '回答しない',
    };
  }
}

enum EScanType {
  qrcode,
  barcode;

  bool get isQRcode => this == EScanType.qrcode;
  bool get isBarcode => this == EScanType.barcode;
}

enum PolicyType { term, privatePolicy }

enum NotificationType {
  SYSTEM_ANNOUNCEMENT,
  MENU_PUBLISHED,
  OTHER;

  static NotificationType fromString(String? value) {
    return switch (value) {
      'SYSTEM_ANNOUNCEMENT' => NotificationType.SYSTEM_ANNOUNCEMENT,
      'MENU_PUBLISHED' => NotificationType.MENU_PUBLISHED,
      _ => NotificationType.OTHER,
    };
  }
}

enum AppFlavor {
  development,
  staging,
  production;

  bool get isDevelopment => this == AppFlavor.development;
  bool get isStaging => this == AppFlavor.staging;
  bool get isProduction => this == AppFlavor.production;

  // env
  String get envFileName {
    return switch (this) {
      AppFlavor.development => '.env',
      AppFlavor.staging => '.env.stg',
      AppFlavor.production => '.env.prod',
    };
  }
}
