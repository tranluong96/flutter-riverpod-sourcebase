class DeviceInfoModel {
  final String platform;
  final String osVersion;
  final String deviceName;
  final String appVersion;
  final String appName;
  final String deviceId;
  final String userAgent;

  DeviceInfoModel({
    required this.platform,
    required this.osVersion,
    required this.deviceName,
    required this.appVersion,
    required this.appName,
    required this.deviceId,
    required this.userAgent,
  });

  Map<String, dynamic> toJson() => {
    'platform': platform,
    'osVersion': osVersion,
    'deviceName': deviceName,
    'appVersion': appVersion,
    'appName': appName,
    'deviceId': deviceId,
    'userAgent': userAgent,
  };
}
