import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to the Support Us Page!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Thank you for considering supporting us!',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Ways to Support:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '1. Spread the Word:',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Tell your friends and family about our app. Word of mouth helps us grow!',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text(
                '2. Rate and Review:',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'If you enjoy using our app, please consider leaving a positive review on the app store. Your feedback is invaluable!',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text(
                '3. Provide Feedback:',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'We value your input! If you have suggestions for improvement or encounter any issues, please let us know at feedback@example.com.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Thank you for your support!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
