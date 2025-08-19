import 'package:doit/app_views/profile_view/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileView extends StatelessWidget {
   ProfileView({super.key});

ProfileController profileController=Get.put(ProfileController());
  @override
  
  Widget build(BuildContext context) {
    profileController.getUserId();
  profileController.fetUserData();
    return Scaffold(
      body: Obx(()=>
          Column(
            children: [
              Card(
                color: Colors.white54,
                child: ListTile(
                  title: Text(profileController.username.toString()),
                  subtitle: Text(profileController.useremail.toString()),
                ),
              )
            ],
          )),
    );
  }
}
