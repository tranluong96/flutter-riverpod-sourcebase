// import 'package:permission_handler/permission_handler.dart';

// enum CameraPermissionStatus { granted, denied, permanentlyDenied }

// class PermissionService {
//   /// check camera permission
//   static Future<CameraPermissionStatus> checkCameraPermission() async {
//     final status = await Permission.camera.status;

//     if (status.isGranted) {
//       return CameraPermissionStatus.granted;
//     }

//     if (status.isPermanentlyDenied) {
//       return CameraPermissionStatus.permanentlyDenied;
//     }

//     return CameraPermissionStatus.denied;
//   }

//   /// request camera permission
//   static Future<CameraPermissionStatus> requestCameraPermission() async {
//     final status = await Permission.camera.request();

//     if (status.isGranted) {
//       return CameraPermissionStatus.granted;
//     }

//     if (status.isPermanentlyDenied) {
//       return CameraPermissionStatus.permanentlyDenied;
//     }

//     return CameraPermissionStatus.denied;
//   }

//   /// open system setting
//   static Future<void> openSetting() async {
//     await openAppSettings();
//   }
// }
