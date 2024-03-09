import 'package:firebase_app/utils/colorconstans.dart';
import 'package:firebase_app/utils/image.dart';
import 'package:firebase_app/view/home/main_page/main_page.dart';
import 'package:firebase_app/view/home/signup/SignUp.dart';
import 'package:firebase_app/view/widgets/authbutton.dart';
import 'package:firebase_app/view/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 279,
                    child: Image.asset("assets/images/signup2.png"),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Login Here',
                    style: TextStyle(
                      fontSize: 28,
                      color: AppColors.kPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "Welcome back, you've",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'been missed!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  AuthField(
                    iconColor: AppColors.kLavender,
                    controller: emailController,
                    icon: AppAssets.kMail,
                    hintText: 'Email',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address';
                      } else {
                        final emailRegex =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  AuthField(
                    obscureText: true,
                    iconColor: AppColors.kPeriwinkle,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    icon: AppAssets.kLock,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (!_isPasswordStrong(value)) {
                        return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit.';
                      }
                      return null;
                    },
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 20.0),
                  AuthButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          final userCredential =
                              await auth.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                            (routes) => false,
                          );
                          print(
                              'User signed in: ${userCredential.user!.email}');
                        } catch (e) {
                          print('Error signing in: $e');
                        }
                      }
                    },
                    text: 'Login',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: const Text(
                      'Create new account',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

bool _isPasswordStrong(String password) {
  if (password.length < 8) {
    return false;
  }
  if (!password.contains(RegExp(r'[A-Z]'))) {
    return false;
  }
  if (!password.contains(RegExp(r'[a-z]'))) {
    return false;
  }
  if (!password.contains(RegExp(r'[0-9]'))) {
    return false;
  }
  return true;
}
