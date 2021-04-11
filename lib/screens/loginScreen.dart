import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dataPageScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _LoginScreenState();
  final _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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

                    controller: _emailController,
                    decoration: InputDecoration(labelText: "Special Email"),
                    validator: (String val ){

                        if(val.isEmpty){
                            return "Enter a Special Email";}

                      return null ;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: (String val ){
                        if(val.isEmpty) {
                          return "Enter a Password";
                        }
                      return null ;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text('Login'),
                    onPressed:() async {
                      if(_formKey.currentState.validate()){
                        _singinWithEmailPassword();
                      }
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
  void _singinWithEmailPassword() async {
    try {
        final User user = (await _auth.signInWithEmailAndPassword
          (email: _emailController.text, password: _passwordController.text)).user;
        if(!user.emailVerified){
          await user.sendEmailVerification();
        }
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return dataPageScreen(
          user: user,
        );
        }));

    }
    catch(e){
      _scaffoldKey.currentState.showBottomSheet((context) => Text('flaied'));
      print(e);
    }
  }
}