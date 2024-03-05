import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotifications {
  static final firebaseMessaging = FirebaseMessaging.instance;

  static Future init() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    final token = await firebaseMessaging.getToken();
    print("token $token");
  }
}
