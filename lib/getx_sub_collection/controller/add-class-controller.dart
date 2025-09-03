import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AddClassController extends GetxController{
  TextEditingController classNAmeCotroller=TextEditingController();
  TextEditingController classIdCotroller=TextEditingController();

  addClass()async{
    String id='1';
    await FirebaseFirestore.instance.collection('classes').doc(classIdCotroller.text).set({
      'class-name':classIdCotroller.text,
      'class-id':classIdCotroller.text
    });
  }

}