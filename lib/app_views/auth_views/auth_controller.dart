import 'package:doit/app_views/profile_view/profile_controller.dart';
import 'package:doit/app_views/profile_view/profile_view.dart';
import 'package:doit/utills/show-message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  var isLoading=false.obs;
  ProfileController profileController=ProfileController();
  register()async{
    isLoading.value=true;
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text,
      );
     await profileController.getUserId();
      profileController.username.value=nameController.text;
      print("username: ${profileController.username.value}");
      print("userId: ${profileController.userId.value}");
      print("email: ${profileController.useremail.value}");
     await profileController.insertUserData();
    ShowMessage.successMessage('Success', 'Register successfully');
     //  Get.snackbar("Success", "User registered successfully");
      nameController.clear();
      emailController.clear();
      passwordController.clear();
    }
    catch(error){
      isLoading.value=false;
      ShowMessage.errorMessage('Error', error.toString());
      // Get.snackbar(
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      //   'Singup_Failed',
      //   error.toString(),
      // );
    }
  }
  profile1(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfileView()));
  }
  login()async{
    isLoading.value=true;
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(),
        password: passwordController.text.trim()).then((value){
          isLoading.value=false;
    }).onError((error,handleError){
      isLoading.value=false;
    });
  }

}