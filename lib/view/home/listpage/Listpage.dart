import 'package:firebase_app/controller/db.dart';
import 'package:firebase_app/utils/colorconstans.dart';
import 'package:firebase_app/view/home/homepage/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../add_taskpage/add_user.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.kPrimary, // Set the background color
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddUser()),
              );
            },
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage())));
              },
              icon: const Icon(
                Icons.logout_rounded,
                size: 30, // Adjust the size as needed
                color: Colors.white, // Set the color to white
              ),
            ),
          ],
          backgroundColor: AppColors.kPrimary,
          title: const Text(
            "Student Data",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Consumer<StudentData>(
              builder: (BuildContext context, studentData, child) {
                final data = studentData.getData();
                return StreamBuilder(
                  stream: data,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Error occurred');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 170,
                              width: 170,
                              child: Lottie.asset('assets/lottie/nodata.json'),
                            ),
                            const Text(
                              'No Data Available',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final studentData = snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                            left: 10.0,
                            top: 5.0,
                          ),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: AppColors.kPrimary,
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/update',
                                  arguments: {
                                    'Name': studentData['Name'],
                                    'Age': studentData['Age'],
                                    'Email': studentData['Email'],
                                    'Phone': studentData['Phone'],
                                    'course': studentData['course'],
                                    'id': studentData.id,
                                  },
                                );
                              },
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(studentData['Image']),
                              ),
                              title: Text(
                                studentData['Name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors
                                      .white, // Set the text color to white
                                ),
                              ),
                              subtitle: Text(
                                studentData['Email'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors
                                      .white, // Set the text color to white
                                ),
                              ),
                              trailing: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 86, 81, 81),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Provider.of<StudentData>(context,
                                            listen: false)
                                        .delete(studentData.id);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}