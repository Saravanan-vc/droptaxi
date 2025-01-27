import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droptaxi/service/custompop.dart';
import 'package:flutter/material.dart';

class FirebaseDataClass {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //fetch data
  Future<List> getData() async {
    var data = await firebaseFirestore.collection("from").get();
    debugPrint('sucess fult fetched data');
    return data.docs;
  }

  //send data
  Future<void> sendData(Map<String, dynamic> data) async {
    await firebaseFirestore.collection("booked").add(data).then((value) {
      customPOPmsg("Sucessfully submite", Colors.green);
      debugPrint(value.toString());
    }).catchError((error) {
      customPOPmsg("Something Went Wrong", Colors.red);
      debugPrint("Error:$error");
    });
  }
}
