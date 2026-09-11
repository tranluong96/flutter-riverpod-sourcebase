import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:myapp/data/models/device/device_info_model.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoService {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static Future<DeviceInfoModel> getDeviceInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();

    String platform = '';
    String osVersion = '';
    String deviceName = '';
    String deviceId = '';

    if (Platform.isAndroid) {
      final android = await _deviceInfo.androidInfo;

      platform = 'android';
      osVersion = android.version.release;
      deviceName = '${android.manufacturer} ${android.model}';
      deviceId = android.id;
    } else if (Platform.isIOS) {
      final ios = await _deviceInfo.iosInfo;

      platform = 'ios';
      osVersion = ios.systemVersion;
      deviceName = ios.modelName;
      deviceId = ios.identifierForVendor ?? '';
    }

    // User agent: deviceName+osVersion
    final userAgent = '$deviceName $osVersion';

    return DeviceInfoModel(
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
