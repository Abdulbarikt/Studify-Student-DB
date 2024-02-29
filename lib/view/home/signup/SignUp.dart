import 'package:firebase_app/utils/colorconstans.dart';
import 'package:firebase_app/view/home/listpage/Listpage.dart';
import 'package:firebase_app/view/home/login/Login.dart';
import 'package:firebase_app/view/widgets/authbutton.dart';
import 'package:firebase_app/view/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/image.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final TextEditingController nameController = TextEditingController();
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
                  const SizedBox(height: 30.0),
                  SizedBox(
                    height: 200,
                    width: 279,
                    child: Image.asset("assets/images/signup1.png"),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 28,
                      color: AppColors.kPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  AuthField(
                    iconColor: const Color(0xFFFFEADB),
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    icon: AppAssets.kUser,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Full Name';
                      } else if (value.contains(RegExp(r'[0-9]'))) {
                        return 'Full Name should not contain digits';
                      }
                      return null;
                    },
                    hintText: 'Full Name',
                  ),
                  const SizedBox(height: 16),
                  AuthField(
                    iconColor: const Color(0xFFEBD9EF),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    icon: AppAssets.kMail,
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
                    hintText: 'Email address',
                  ),
                  const SizedBox(height: 16),
                  AuthField(
                    obscureText: true,
                    iconColor: const Color(0xFFE0E9FF),
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
                          UserCredential userCredential =
                              await auth.createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListPage()),
                            (routes) => false,
                          );

                          print('User created: ${userCredential.user!.email}');
                        } catch (e) {
                          print('Error creating user: $e');
                        }
                      }
                    },
                    text: 'Signup',
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      'Already have an account? Login',
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
