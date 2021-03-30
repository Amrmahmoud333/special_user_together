import 'package:flutter/material.dart';
import 'dataPageScreen.dart';
import 'dataPageScreen.dart';
import 'dataPageScreen.dart';
import 'dataPageScreen.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _LoginScreenState();
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBC02D),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///for email
                  TextFormField(
                    key: ValueKey('email'),
                    onSaved: (val) => _email = val,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Email Address"),
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    onSaved: (val) => _password = val,
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text('Login'),
                    onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    dataPageScreen()),
                    );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}