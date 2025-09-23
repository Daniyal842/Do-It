
import 'package:doit/app_views/home_view/profile_controller.dart';
import 'package:doit/common/widgets/show-message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;
  ProfileController profileController = ProfileController();

  register() async {
    isLoading.value = true;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      await profileController.getUserId();
      profileController.username.value = nameController.text;
      print("username: ${profileController.username.value}");
      print("userId: ${profileController.userId.value}");
      print("email: ${profileController.useremail.value}");
      await profileController.insertUserData();
      print('----------data inserted successfully');
      ShowMessage.successMessage('Success', 'Register successfully');

      isLoading.value = false;
      //Get.toNamed(page)
      Get.offNamed("/SignInView");
      nameController.clear();
      emailController.clear();
      passwordController.clear();

    } catch (error) {
      isLoading.value = false;
      ShowMessage.errorMessage('Error', error.toString());
    }

  }

  login() async {
    isLoading.value = true;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((value) {
      isLoading.value = false;
      emailController.clear();
      passwordController.clear();
      Get.offNamed("/BottomBar");
    }).onError((error, handleError) {
      isLoading.value = false;
    });
  }

  // nav_to_SignIn(BuildContext context) {
  //   // Get.toNamed("/SignView");
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInView()));
  //   nameController.clear();
  //   emailController.clear();
  //   passwordController.clear();
  // }
  //
  // nav_to_SignUp(BuildContext context)  {
  //   Get.toNamed("/SignUpView");
  //   emailController.clear();
  //   passwordController.clear();
  // }
}
