// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB4iVgYXnyWhoGCwb_Y6uioTwPTeNXFRyM',
    appId: '1:280635250677:web:6d894fde707b786fc0b2bc',
    messagingSenderId: '280635250677',
    projectId: 'usermanagement-72768',
    authDomain: 'usermanagement-72768.firebaseapp.com',
    storageBucket: 'usermanagement-72768.appspot.com',
    measurementId: 'G-1L4WMRN562',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0YrZgfZHl-ZGP5GdZc22EjpzIcZY7_gw',
    appId: '1:280635250677:android:56dc0e0e64c6b99bc0b2bc',
    messagingSenderId: '280635250677',
    projectId: 'usermanagement-72768',
    storageBucket: 'usermanagement-72768.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAo0YYNh7flKu3oR76804Jnjgn9916dvZw',
    appId: '1:280635250677:ios:5f73fb076b5b2159c0b2bc',
    messagingSenderId: '280635250677',
    projectId: 'usermanagement-72768',
    storageBucket: 'usermanagement-72768.appspot.com',
    iosBundleId: 'com.example.firebaseApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAo0YYNh7flKu3oR76804Jnjgn9916dvZw',
    appId: '1:280635250677:ios:5a0f1ef8dd6bdc0ac0b2bc',
    messagingSenderId: '280635250677',
    projectId: 'usermanagement-72768',
    storageBucket: 'usermanagement-72768.appspot.com',
    iosBundleId: 'com.example.firebaseApp.RunnerTests',
  );
}
