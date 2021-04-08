import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:special_user_together/addNewData.dart';
import 'package:special_user_together/screens/drawerScreen.dart';
import 'package:special_user_together/services/dataBaseManager.dart';
import '../models/data.dart';

class dataPageScreen extends StatefulWidget {
    final User user;

  const dataPageScreen({Key key, this.user}) : super(key: key);

  @override
  _dataPageScreenState createState() => _dataPageScreenState();
}

class _dataPageScreenState extends State<dataPageScreen> {
  final GlobalKey<ScaffoldState> _scafflodKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  _dataPageScreenState();
  final List<Data> userData = [];
  DatabaseManager databaseManager = DatabaseManager();

  void _addData(String  address , String phone , String numFamilyPerson){
    final newData = Data(
      address: address,
      phone: phone,
      numFamilyPerson: numFamilyPerson
    );
    setState(() {
      databaseManager.createData(address,phone,numFamilyPerson);
      userData.add(newData);
    });
  }
 /* void _deleteData(String id){
    setState(() {
      _userData.removeWhere((data)  {
        return data.id==id ? true : false ;
      });
    });
  }*/
  void _startAddNewData(BuildContext ctx){
    showModalBottomSheet(context: ctx,
        builder: (_){
      return GestureDetector(
        onTap: (){},
        child: addNewData(_addData),
        behavior: HitTestBehavior.opaque,
      );
        }
    );

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var appBarSize = AppBar().preferredSize.height;
    var bottomNavigationBarSize = kBottomNavigationBarHeight;
    var statusBarHeight = MediaQuery.of(context).padding.top;

    final appBar = AppBar(
      title: Text('Data'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed:() => _startAddNewData(context),
        )
      ],
    );

    return Scaffold(
      key: _scafflodKey,
      appBar: appBar,
      body: Container(
        height: size.height -
            appBarSize -
            bottomNavigationBarSize -
            statusBarHeight,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('data').snapshots(),
          builder: (ctx , snapshot){
            final docs = snapshot.data.docs;
            if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null)
            { return CircularProgressIndicator(); }
            return GridView.builder(
                itemCount: docs.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
                itemBuilder: (ctx , i){
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title:  Text(docs[i]['address']),
                      subtitle:  Text(docs[i]['phone']),
                      trailing: Text(docs[i]['numFamilyPerson']),
                    ),
                  );
                },

            );
          },
        ),
      ),
      backgroundColor: Colors.white,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewData(context),
      ),
      drawer: Drawer(child: drawerScreen(),),
    );
  }
}
