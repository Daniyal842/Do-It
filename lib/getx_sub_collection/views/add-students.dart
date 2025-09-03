import 'package:doit/getx_sub_collection/controller/add-student-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddStudents extends StatelessWidget {
  final String classId;
  const AddStudents({super.key, required this.classId});

  @override
  Widget build(BuildContext context) {
   AddStudentsController addStudentsController=Get.put(AddStudentsController());
    return Scaffold(
      body: Column(children: [
        TextButton(onPressed: (){
          addStudentsController.addStudent(classId);
        }, child: Text('Add Student'))
      ],),
    );
  }
}
