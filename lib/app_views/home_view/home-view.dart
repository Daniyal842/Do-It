import 'package:doit/app_views/home_view/profile_controller.dart';
import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/widgets/app_text.dart';
import 'package:doit/common/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    profileController.getUserId();
    profileController.fetUserData();
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            Obx(
              () => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                child: Card(
                  color: AppColors.transparentBlue,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,backgroundColor: AppColors.blue3,
                      child: Center(
                        child: Icon(Icons.person),
                      ),
                    ),
                    title: AppText(
                      text: profileController.username.toString(),
                    ),
                    subtitle: AppText(
                      text: profileController.useremail.toString(),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
