import 'package:firebase_app/utils/colorconstans.dart';
import 'package:firebase_app/view/home/homepage/HomePage.dart';
import 'package:firebase_app/view/home/profile_page/faq.dart';
import 'package:firebase_app/view/home/profile_page/help.dart';
import 'package:firebase_app/view/home/profile_page/support.dart';
import 'package:firebase_app/view/home/profile_page/terms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/profile_name_mail.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context).getUserData();

    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: Column(
                    children: [
                      Text(
                        profileProvider.name,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        profileProvider.email,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Divider(
                  color: AppColors.kPrimary,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.policy),
                  title: Text('Terms and Conditions'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Terms()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text('FAQ'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Faq()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.support),
                  title: Text('Support Us'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SupportPage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HelpPage()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: AppColors.kPrimary,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: AppColors.kPrimary, // Change the color of the text
                    ),
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (route) => false);
                  },
                  // onTap: () => profileProvider.logout(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
