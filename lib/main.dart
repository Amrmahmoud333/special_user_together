import 'package:flutter/material.dart';
import 'package:special_user_together/dataPageScreen.dart';


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
        accentColor: Color(0xFF9E9E9E),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.grey[700],
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: dataPageScreen(),
    );
  }
}
