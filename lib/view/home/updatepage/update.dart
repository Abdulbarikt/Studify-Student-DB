// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_app/controller/db.dart';
import 'package:firebase_app/utils/colorconstans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/view/widgets/sizedbox.dart';
import 'package:provider/provider.dart';
import '../../../controller/upload_image.dart';
import '../../widgets/custom_textfield.dart';

// ignore: must_be_immutable
class Update extends StatelessWidget {
  Update({
    Key? key,
  }) : super(key: key);

  final rollnumberController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final courseController = TextEditingController();
  late String location;
  final _key = GlobalKey<FormState>();

  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = args['Name'];
    ageController.text = args['Age'];
    emailController.text = args['Email'];
    phoneController.text = args['Phone'];
    courseController.text = args['course'];
    final oldImage = args['Image'];
    location = args['location'].toString();
    final studentId = args['id'];
    String imageUrl = '';

    return Scaffold(
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
                    const SizedBox(
                      height: 30,
                    ),
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
                                      ? CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 60,
                                          backgroundImage:
                                              NetworkImage(oldImage),
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
                              hintText: 'First Name',
                              validator: nameValidate,
                              icons: const Icon(Icons.person),
                            ),
                            const Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: ageController,
                              labelText: 'Age',
                              hintText: 'Age',
                              validator: ageValidate,
                              icons: const Icon(Icons.person),
                            ),
                            const Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: emailController,
                              labelText: 'Email',
                              hintText: 'Email',
                              validator: emailValidate,
                              icons: const Icon(Icons.email),
                            ),
                            const Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: phoneController,
                              labelText: 'Phone',
                              hintText: 'Phone',
                              validator: phoneValidate,
                              icons: const Icon(Icons.phone),
                            ),
                            const Sizedbox(height: 15.0),
                            CustomTextFormField(
                              controller: courseController,
                              labelText: 'Course',
                              hintText: 'Course',
                              validator: nameValidate,
                              icons: const Icon(Icons.person),
                            ),
                            const Sizedbox(height: 15.0),
                            Text(location),
                            const Sizedbox(height: 15.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      AppColors.kPrimary, // Text color
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0,
                                      horizontal: 24.0), // Button padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Button border radius
                                  ),
                                  elevation: 3.0, // Button shadow
                                ),
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    imageUrl == ''
                                        ? Provider.of<StudentData>(context,
                                                listen: false)
                                            .upDatedata(
                                                studentId,
                                                nameController,
                                                emailController,
                                                ageController,
                                                phoneController,
                                                courseController,
                                                oldImage,
                                                location)
                                        : Provider.of<StudentData>(context,
                                                listen: false)
                                            .upDatedata(
                                                studentId,
                                                nameController,
                                                emailController,
                                                ageController,
                                                phoneController,
                                                courseController,
                                                imageUrl,
                                                location);
                                  }
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Update',
                                  style:
                                      TextStyle(fontSize: 16.0), // Text style
                                ),
                              ),
                            ),
                            const Sizedbox(height: 45.0),
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
    );
  }
}
