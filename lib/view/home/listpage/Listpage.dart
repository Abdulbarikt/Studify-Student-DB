import 'package:firebase_app/controller/db.dart';
import 'package:firebase_app/utils/colorconstans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                          child: SizedBox(
                            height: 120, // Adjust the height as needed
                            child: Container(
                              margin: const EdgeInsets.only(
                                  right: 10.0, left: 10.0, top: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.kPrimary,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
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
                                        'Image': studentData['Image'],
                                        'location': studentData['location'],
                                        'id': studentData.id,
                                      },
                                    );
                                  },
                                  leading: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(studentData['Image']),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    studentData['Name'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: Text(
                                    studentData['course'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  trailing: Container(
                                    width: 50,
                                    height: 50,
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
                                        CupertinoIcons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
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
