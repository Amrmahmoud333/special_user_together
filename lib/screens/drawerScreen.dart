import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'loginScreen.dart';

class drawerScreen extends StatefulWidget {

  final User user ;

  const drawerScreen({Key key, this.user}) : super(key: key);
  @override
  _drawerScreenState createState() => _drawerScreenState();
}

class _drawerScreenState extends State<drawerScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final String documentId = FirebaseAuth.instance.currentUser.uid;
  final GlobalKey<ScaffoldState> _scafflodKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder<DocumentSnapshot>(
                  future: users.doc(documentId).get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data = snapshot.data.data();
                      return CircleAvatar(
                        backgroundImage: NetworkImage(data['imageUrl']),
                        radius: 50.0,
                        backgroundColor: Colors.purple, // must be Image
                      );
                    }
                    return Text("loading");
                  }),
              SizedBox(
                height: 5.0,
              ),
              FutureBuilder<DocumentSnapshot>(
                future: users.doc(documentId).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data = snapshot.data.data();
                    return Text("${data['username']}");
                  }

                  return Text("loading");
                },
              ),
             ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),


      ListTile(
        /*onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        },*/
        leading: Icon(
          Icons.edit,
          color: Colors.black,
        ),
        title: Text("Edit Profile"),
      ),
      ListTile(
        onTap: () async{
          _signOut().whenComplete(() {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
              return LoginScreen();
            }));
          });
        },
        leading: Icon(
          Icons.logout,
          color: Colors.black,
        ),
        title: Text("LogOut"),
      ),
    ]);
  }
  Future _signOut() async{
    await _auth.signOut();
  }
}