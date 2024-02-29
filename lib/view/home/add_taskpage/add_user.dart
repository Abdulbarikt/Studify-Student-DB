import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_app/controller/db.dart';
import 'package:firebase_app/utils/colorconstans.dart';
import 'package:firebase_app/view/widgets/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_textfield.dart';

class AddUser extends StatelessWidget {
  AddUser({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final courseController = TextEditingController();
  File? image;

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: AppColors.kPrimary, // Updated app bar color
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.kPrimary,
                Colors.white
              ], // Updated gradient colors
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    children: [
                      const Text(
                        'Add Student',
                        style: TextStyle(fontSize: 35),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white, // Updated container color
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Column(
                            children: [
                              Consumer<StudentData>(
                                builder: (BuildContext context, studentData,
                                    Widget? child) {
                                  image = studentData.imageFile;
                                  return InkWell(
                                    onTap: () {
                                      Provider.of<StudentData>(context,
                                              listen: false)
                                          .imagePicker();
                                    },
                                    child: image != null
                                        ? CircleAvatar(
                                            maxRadius: 60,
                                            backgroundImage:
                                                FileImage(File(image!.path)),
                                          )
                                        : DottedBorder(
                                            dashPattern: const [15, 5],
                                            borderType: BorderType.Circle,
                                            child: const CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              maxRadius: 60,
                                              backgroundImage: AssetImage(
                                                  "assets/images/camera.png"),
                                            ),
                                          ),
                                  );
                                },
                              ),
                              const Sizedbox(height: 15.0),
                              CustomTextFormField(
                                controller: nameController,
                                labelText: 'First Name',
                                hintText: 'Enter First Name',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                                icons: const Icon(Icons.person),
                              ),
                              const Sizedbox(height: 15.0),
                              CustomTextFormField(
                                controller: ageController,
                                labelText: 'Age',
                                hintText: 'Enter Age',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your age';
                                  }

                                  final RegExp ageRegex =
                                      RegExp(r'^[1-9][0-9]?$|^120$');
                                  if (!ageRegex.hasMatch(value)) {
                                    return 'Invalid age';
                                  }

                                  return null;
                                },
                                icons: const Icon(Icons.person),
                              ),
                              const Sizedbox(height: 15.0),
                              CustomTextFormField(
                                controller: emailController,
                                labelText: 'Email',
                                hintText: 'Enter Email',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }

                                  final RegExp emailRegex = RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                  if (!emailRegex.hasMatch(value)) {
                                    return 'Invalid email';
                                  }

                                  return null;
                                },
                                icons: const Icon(Icons.email),
                              ),
                              const Sizedbox(height: 15.0),
                              CustomTextFormField(
                                controller: phoneController,
                                labelText: 'Phone',
                                hintText: 'Enter Phone',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }

                                  final RegExp phoneRegex =
                                      RegExp(r'^[0-9]{10}$');
                                  if (!phoneRegex.hasMatch(value)) {
                                    return 'Phone number must contain exactly 10 digits';
                                  }

                                  return null;
                                },
                                icons: const Icon(Icons.phone),
                              ),
                              const Sizedbox(height: 15.0),
                              CustomTextFormField(
                                controller: courseController,
                                labelText: 'Course',
                                hintText: 'Enter Course',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your course';
                                  }
                                  return null;
                                },
                                icons: const Icon(Icons.school),
                              ),
                              const Sizedbox(height: 15.0),
                              Consumer<StudentData>(
                                builder: (BuildContext context, studentData,
                              
                                    Widget? child) {
                                  String imageUrl = studentData.imageUrl;
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            AppColors.kPrimary, // Text color
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal: 24.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        elevation: 3.0,
                                      ),
                                      onPressed: () {
                                        if (_key.currentState!.validate()) {
                                          final name = nameController.text;
                                          final age = ageController.text;
                                          final email = emailController.text;
                                          final phone = phoneController.text;
                                          final course = courseController.text;
                                          Provider.of<StudentData>(context,
                                                  listen: false)
                                              .addToStorage(image!);

                                          Provider.of<StudentData>(context,
                                                  listen: false)
                                              .addData(name, age, email, phone,
                                                  course, imageUrl);
                                          nameController.clear();
                                          ageController.clear();
                                          emailController.clear();
                                          phoneController.clear();
                                          courseController.clear();

                                          Navigator.pop(context);
                                        }
                                        Provider.of<StudentData>(context,
                                                listen: false)
                                            .getData();
                                      },
                                      child: const Text(
                                        'Submit',
                                        style: TextStyle(
                                            fontSize: 16.0), // Text style
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
