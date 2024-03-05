import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to the Help Page!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'If you are experiencing issues with our app or have any questions, we are here to help!',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Common FAQs:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '1. How do I reset my password?',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'If you forgot your password, you can use the "Forgot Password" feature on the login screen to reset it.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text(
                '2. How can I update my profile information?',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'You can update your profile information by navigating to the "Settings" page within the app.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Contact Us:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'If you have any further questions or need assistance, feel free to contact our support team at support@example.com.',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
