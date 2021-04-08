import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:special_user_together/models/data.dart';

class DatabaseManager{
  final CollectionReference dataInfo = FirebaseFirestore.instance.collection('data');
  //Data data = Data();
  Future<void>  createData(String address , String phone , String numFamilyPerson) {
        return dataInfo.add({

          'address' : address,
          'phone' : phone,
          'numFamilyPerson' : numFamilyPerson

        }).then((value) => print("Data Added"))
            .catchError((error) => print("Failed to add data: $error"));
  }

}