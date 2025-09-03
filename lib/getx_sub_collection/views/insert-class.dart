import 'package:doit/getx_sub_collection/controller/add-class-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class AddClass extends StatelessWidget {
  const AddClass({super.key});

  @override
  Widget build(BuildContext context) {
    AddClassController addClassController=Get.put(AddClassController());
    return Scaffold(
      body: Column(
        children: [
          TextFormField(controller: addClassController.classNAmeCotroller,),
          TextFormField(controller: addClassController.classNAmeCotroller,),
          TextButton(onPressed: (){

          }, child: Text('data'))
        ],
      ),
    );
  }
}
