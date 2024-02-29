import 'package:firebase_app/utils/image.dart';
import 'package:firebase_app/view/home/login/Login.dart';
import 'package:firebase_app/view/home/signup/SignUp.dart';
import 'package:firebase_app/view/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../services/google_services.dart';
import '../../widgets/diciderdrow.dart';
import '../../widgets/socialbutton.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 90,
            ),
            Lottie.asset(
              'assets/lottie/homepage1.json',
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Studify',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Study Hub Simplified',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                CustomButton(
                  text: 'Login',
                  borderRadius: 23,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  buttonColor: const Color.fromARGB(143, 227, 146, 146),
                  textColor: Colors.white,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  text: 'Signup',
                  borderRadius: 23,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ),
                    );
                  },
                  buttonColor: Colors.blue,
                  textColor: Colors.white,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Column(
                    children: [
                      const DividerRow(title: 'Or Sign In with'),
                      const SizedBox(height: 24),
                      SocialButton(
                        onTap: () async {
                          await FirebaseServices().signInWithGoolge();
                        },
                        title: 'Continue with Google',
                        icon: AppAssets.kGoogle,
                        color: const Color(0XFF3E3E3E),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
