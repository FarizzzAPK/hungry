import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static const String _tokenKey = 'auth_token';

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_tokenKey);
  }


  static Future<void> requestGalleryPermission() async {
    PermissionStatus status = await Permission.photos.status;
    if (status.isDenied) {
      status = await Permission.photos.request();
    }

    if (status.isGranted) {
      print("Permission granted, opening gallery...");
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    } else if (status.isLimited) {
      print("Limited access granted");
    }
  }
}