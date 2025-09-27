import 'package:doit/app_views/auth_views/auth_controller.dart';
import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/widgets/app_text.dart';
import 'package:doit/common/widgets/container_button.dart';
import 'package:doit/common/widgets/gradient_background.dart';
import 'package:doit/common/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController=Get.put(AuthController());
    return Scaffold(
      body:  GradientBackground(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 90),
              child: AppText(
                text: "Settings",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.white1,
                    width: 1.5
                  )
                ),
                child: Icon(Icons.person,color: AppColors.white1,),
              ),
              title: AppText(
                text: "Profile",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded,color: AppColors.blue5,),
                highlightColor: AppColors.blue3,
                onPressed: (){},
              ),
              ),
            Divider(
              color: AppColors.white1,
              thickness: 0.5,
            ),
            ListTile(
              leading: Icon(Icons.messenger_outlined,color: AppColors.white1,),
              title: AppText(
                text: "Conversation",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded,color: AppColors.blue5,),
                highlightColor: AppColors.blue3,
                onPressed: (){},
              ),
            ),
            Divider(
              color: AppColors.white1,
              thickness: 0.5,
            ),
            ListTile(
              leading: Icon(Icons.lightbulb,color: AppColors.white1,),
              title: AppText(
                text: "Projects",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded,color: AppColors.blue5,),
                highlightColor: AppColors.blue3,
                onPressed: (){},
              ),
            ),
            Divider(
              color: AppColors.white1,
              thickness: 0.5,
            ),
            ListTile(
              leading: Icon(Icons.policy_sharp,color: AppColors.white1,),
              title: AppText(
                text: "Terms and Policies",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded,color: AppColors.blue5,),
                highlightColor: AppColors.blue3,
                onPressed: (){},
              ),
            ),
            Divider(
              color: AppColors.white1,
              thickness: 0.5,
            ),
            Obx( ()=>authController.isLoading.value
                ? LoadingWidget():ContainerButton(
              onTap: (){
                authController.logout();
              },
              bgColor: AppColors.white1,
              borderRadius: 25,
              iconData: Icons.logout,
              iconColor: AppColors.red2,
              iconSize: 30,
              text: "Logout",
              textColor: AppColors.red2,
              margin: EdgeInsets.symmetric(vertical: 70),
            ),
            )
          ],
        ),
      ),
    );
  }
}
