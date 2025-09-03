import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddStudentsController extends GetxController{

  TextEditingController studentNameControllre=TextEditingController();
  TextEditingController studentRollNoControllre=TextEditingController();

  addStudent(String classid)
  async{
    await FirebaseFirestore.instance.
    collection('classes')
        .doc(classid).
    collection('setudents').doc(studentRollNoControllre.text)
        .set({

    });
  }
}