import 'package:firebase_app/controller/db.dart';
import 'package:firebase_app/controller/profile_name_mail.dart';
import 'package:firebase_app/services/push_Notification.dart';
import 'package:firebase_app/view/home/main_page/main_page.dart';
import 'package:firebase_app/view/home/homepage/HomePage.dart';
import 'package:firebase_app/view/home/updatepage/update.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/location.dart';
import 'controller/upload_image.dart';
import 'services/firebase_options.dart';

Future firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("Some notification Received");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PushNotifications.init();
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessage);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentData()),
        ChangeNotifierProvider(create: (context) => ImageProvide()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        title: 'Studify',
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const MainPage();
              } else {
                return const HomePage();
              }
            }),
        routes: {
          '/update': (context) => Update(),
        },
      ),
    );
  }
}
