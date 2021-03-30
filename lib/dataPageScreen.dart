import 'package:flutter/material.dart';
import 'package:special_user_together/addNewData.dart';
import 'package:special_user_together/drawerScreen.dart';

import 'data.dart';

class dataPageScreen extends StatefulWidget {


  @override
  _dataPageScreenState createState() => _dataPageScreenState();
}

class _dataPageScreenState extends State<dataPageScreen> {
  final List<Data> userData = [];

  /*List<Data> get _recentData {
    return _userData.where((data ) {

    });
  }*/

  void _addData(String  address , String phone , String numFamilyPerson){
    final newData = Data(

      address: address,
      phone: phone,
      numFamilyPerson: numFamilyPerson
    );
    setState(() {
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
      appBar: appBar,

      body: Container(
        height: size.height -
            appBarSize -
            bottomNavigationBarSize -
            statusBarHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < userData.length; i++)
                Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(userData[i].address),
                    subtitle: Text(userData[i].numFamilyPerson),
                    trailing: Text(userData[i].phone),
                  ),
                ),
            ],
          ),
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
