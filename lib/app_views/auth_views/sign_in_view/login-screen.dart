import 'package:doit/app_views/auth_views/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController signupController=Get.put(SignupController());
    return Scaffold(
      body: Column(children: [
        TextFormField(
          controller: signupController.emailController,
        ),
        TextFormField(
          controller: signupController.passwordController,
        ),
        TextButton(onPressed: (){
          
        }, child: Text('Login'))
      ],),
    );
  }
}
