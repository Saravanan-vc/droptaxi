import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droptaxi/service/custompop.dart';
import 'package:flutter/material.dart';

class FirebaseDataClass {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //fetch data
  Future<List> getData() async {
    var data = await firebaseFirestore.collection("Location").get();
    debugPrint('sucess fult fetched data');
    return data.docs;
  }

  Future<List> getInfo() async {
    var data = await firebaseFirestore.collection("Info_services").get();
    return data.docs;
  }

  //send data
  Future<void> sendData(Map<String, dynamic> data) async {
    await firebaseFirestore.collection("booked").add(data).then((value) {
      customPOPmsg("Sucessfully Submitted", Colors.green);
      debugPrint(value.toString());
    }).catchError((error) {
      customPOPmsg("Something Went Wrong", Colors.red);
      debugPrint("Error:$error");
    });
  }
}
