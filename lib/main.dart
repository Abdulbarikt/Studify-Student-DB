import 'package:firebase_app/controller/db.dart';
import 'package:firebase_app/view/home/homepage/HomePage.dart';
import 'package:firebase_app/view/home/listpage/Listpage.dart';
import 'package:firebase_app/view/home/updatepage/update.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/upload_image.dart';
import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        title: 'Studify',
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const ListPage();
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
