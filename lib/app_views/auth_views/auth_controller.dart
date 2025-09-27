
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
  var obscure_signinPassword=true.obs;
  var obscure_signupPassword=true.obs;
  ProfileController profileController = ProfileController();


  toggle_signinPassword(){
    obscure_signinPassword.value=!obscure_signinPassword.value;
  }
  
  toggle_signupPassword(){
    obscure_signupPassword.value=!obscure_signupPassword.value;
  }

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
    isLoading.value=true;
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim())
      .then((onValue){
        ShowMessage.successMessage('Success', 'Register successfully');
        isLoading.value = false;
          emailController.clear();
          passwordController.clear();
          Get.offNamed("/BottomBar");
      });
    }on FirebaseAuthException catch(e){
      // ✅ Firebase specific errors
      isLoading.value = false;
      String msg = "";
      if (e.code == 'user-not-found') {
        msg = "No account found for this email.";
      } else if (e.code == 'wrong-password') {
        msg = "Incorrect password. Please try again.";
      } else if (e.code == 'invalid-email') {
        msg = "Invalid email format.";
      } else if (e.code == 'network-request-failed') {
        msg = "Please check your internet connection.";
      } else {
        msg = "Enter Your email and password";
      }

      ShowMessage.errorMessage('Login Failed', msg);
    } catch (e) {
      // ✅ Any other error
      ShowMessage.errorMessage('Error', "Something went wrong. Please try again.");
    }
  }

  logout() async {
    try {
      isLoading.value = true;

      await FirebaseAuth.instance.signOut(); // 👈 Firebase se logout

      isLoading.value = false;

      // login screen pe redirect
      Get.offAllNamed("/Login"); // 👈 route ka naam apne hisaab se change karna
    } catch (e) {
      isLoading.value = false;
      print("Logout error: $e");
    }
  }


nav_to_SignIn(BuildContext context) {
  Get.offNamed("/SignInView");
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  nav_to_SignUp(BuildContext context)  {
    Get.offNamed("/SignUpView");
    emailController.clear();
    passwordController.clear();
  }
}
