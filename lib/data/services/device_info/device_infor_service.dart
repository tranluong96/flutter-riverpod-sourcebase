import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:myapp/data/models/device/device_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoService {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static Future<DeviceInfo> getDeviceInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final androidIdPlugin = await const AndroidId().getId();

    String platform = '';
    String osVersion = '';
    String deviceName = '';
    String deviceId = '';

    if (Platform.isAndroid) {
      final android = await _deviceInfo.androidInfo;

      platform = 'android';
      osVersion = android.version.release;
      deviceName = '${android.manufacturer} ${android.model}';
      deviceId = androidIdPlugin ?? DateTime.now().microsecond.toString();
    } else if (Platform.isIOS) {
      final ios = await _deviceInfo.iosInfo;

      platform = 'ios';
      osVersion = ios.systemVersion;
      deviceName = ios.modelName;
      deviceId = ios.identifierForVendor ?? DateTime.now().microsecond.toString();
    }

    // User agent: deviceName+osVersion
    final userAgent = '$deviceName $osVersion';

    return DeviceInfo(
      platform: platform,
      osVersion: osVersion,
      deviceName: deviceName,
      appVersion: packageInfo.version,
      appName: packageInfo.appName,
      deviceId: deviceId,
      userAgent: userAgent,
    );
  }
}
