import 'package:flutter/material.dart';
import 'package:special_user_together/screens/dataPageScreen.dart';
import 'package:special_user_together/screens/loginScreen.dart';


void main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // connectScreen connectScreenn = new connectScreen();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFFBC02D),
        accentColor: Colors.grey[700],
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.grey[700],
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
