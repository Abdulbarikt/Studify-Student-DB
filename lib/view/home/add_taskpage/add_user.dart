import 'dart:io';

import 'package:firebase_app/controller/db.dart';
import 'package:firebase_app/controller/upload_image.dart';
import 'package:firebase_app/utils/colorconstans.dart';
import 'package:firebase_app/view/widgets/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/location.dart';
import '../../widgets/custom_textfield.dart';

class AddUser extends StatelessWidget {
  AddUser({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final courseController = TextEditingController();
  File? image;
  String imageUrl = '';

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final location = Provider.of<LocationProvider>(context);

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
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white, // Updated container color
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  imageUrl = await Provider.of<ImageProvide>(
                                          context,
                                          listen: false)
                                      .uploadImage();
                                },
                                child: Consumer<ImageProvide>(
                                  builder: (BuildContext context,
                                      ImageProvide value, Widget? child) {
                                    return (imageUrl == '')
                                        ? const CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 60,
                                            backgroundImage: AssetImage(
                                                "assets/images/camera.png"),
                                          )
                                        : CircleAvatar(
                                            radius: 60,
                                            backgroundImage:
                                                NetworkImage(imageUrl),
                                          );
                                  },
                                ),
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
                              Sizedbox(height: 15.0),
                              Text(location.currentAddress),
                              Sizedbox(height: 15.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      AppColors.kPrimary, // Text color
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 24.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  elevation: 3.0, // Elevation
                                ),
                                onPressed: () async {
                                  await Provider.of<LocationProvider>(context,
                                          listen: false)
                                      .getLocation();
                                },
                                child: Text(
                                  "Add location",
                                  style:
                                      TextStyle(fontSize: 16.0), // Text style
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Consumer<StudentData>(
                                builder: (BuildContext context, studentData,
                                    Widget? child) {
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
                                              .addData(
                                                  name,
                                                  age,
                                                  email,
                                                  phone,
                                                  course,
                                                  imageUrl,
                                                  location.currentAddress);
                                          nameController.clear();
                                          ageController.clear();
                                          emailController.clear();
                                          phoneController.clear();
                                          courseController.clear();
                                          location.clearCurrentAddress();
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
