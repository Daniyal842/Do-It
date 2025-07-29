import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SingupScreen extends StatelessWidget {
  SingupScreen({super.key});
  SingupController singupController = Get.put(SingupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              controller: singupController.nameController,
              decoration: InputDecoration(
                hintText: 'Your Name'
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              controller: singupController.emailController,
              decoration: InputDecoration(
                hintText: 'Your Email'
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              controller: singupController.passwordController,
              decoration: InputDecoration(
                hintText: 'Create Paaaword'
              ),
            ),
          ),
          Obx(() {
            return singupController.isLoading == true
                ? CircularProgressIndicator()
                : GestureDetector(
                    onTap: () {
                      singupController.register();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green,
                            blurRadius: 10,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Text(
                        "SingUp",
                        style: GoogleFonts.poppins(color: Colors.white54),
                      ),
                    ));
          })
        ],
      ),
    );
  }
}

class SingupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  register() async {
    isLoading.value=true;
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
    )
        .then((onValue) async {
      String userId = await FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('userData').add({
        'userId': userId,
        'email': emailController.text.trim(),
        'name': nameController.text
      });
    }).onError((error,handelError){
      isLoading.value=false;
      Get.snackbar('Error', error.toString());
    });
  }
}
