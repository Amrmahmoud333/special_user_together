import 'package:flutter/material.dart';
class addNewData extends StatefulWidget {

  final Function addData;
  addNewData(this.addData);

  @override
  _addNewDataState createState() => _addNewDataState();
}

class _addNewDataState extends State<addNewData> {
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _numFamilyPersonController = TextEditingController();

  void _sumitData(){
    if(_addressController.text.isEmpty || _phoneController.text.isEmpty
    || _numFamilyPersonController.text.isEmpty
    )
      return ;
    final enteredAddress = _addressController.text;
    final enteredPhone = _phoneController.text;
    final enterednumFamilyPerson =_numFamilyPersonController.text;

    widget.addData(
      enteredAddress, enteredPhone,enterednumFamilyPerson
    );
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom +10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Address'),
                  controller: _addressController,

                  onSubmitted: (_) => _sumitData(),
                ),

                TextField(
                  decoration: InputDecoration(labelText: 'Phone'),
                   controller: _phoneController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _sumitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Number of family members'),
                  controller: _numFamilyPersonController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _sumitData(),
                ),


                RaisedButton(
                  onPressed: () {
                    widget.addData(
                      _addressController.text,
                      _phoneController.text,
                      _numFamilyPersonController.text,
                    );
                    Navigator.of(context).pop();
                  },
                  child: Text('Add Data'),
                  textColor: Theme.of(context).textTheme.button.color,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          )
      ),
    );
  }
}
