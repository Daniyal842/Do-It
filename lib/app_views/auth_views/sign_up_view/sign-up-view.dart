import 'package:doit/app_views/auth_views/auth_controller.dart';
import 'package:doit/app_views/auth_views/sign_in_view/sign-in-view.dart';
import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/constants/app-icons.dart';
import 'package:doit/common/constants/app-images.dart';
import 'package:doit/common/widgets/app_text.dart';
import 'package:doit/common/widgets/app_textform.dart';
import 'package:doit/common/widgets/container_button.dart';
import 'package:doit/common/widgets/custom-textbutton.dart';
import 'package:doit/common/widgets/gradient_background.dart';
import 'package:doit/common/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isloading = false;
  AuthController authController=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(40),
                child: ImageIcon(
                  AssetImage(AppIcons.checkmark),
                  size: 80,
                  color: AppColors.white1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "Welcom Back to ",
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  Text(
                    "Do It",
                    style: GoogleFonts.darumadropOne(
                        color: AppColors.white1,
                        fontSize: 25,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              AppText(
                text: "create an account and join us now",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white1,
                ),
                child: AppTextForm(
                  hintText: "Name",
                  prefixIcon: Icon(Icons.person_outline),
                  controller: authController.nameController,

                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white1,
                ),
                child: AppTextForm(
                  hintText: "E-mail",
                  prefixIcon: Icon(Icons.email),
                  controller: authController.emailController,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white1,
                ),
                child: AppTextForm(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock_outlined),
                  controller: authController.passwordController,
                ),
              ),
              Obx(() => authController.isLoading.value
                  ? LoadingWidget()
                  : ContainerButton(
                onTap: () {
                  authController.register();
                },
                text: 'Sign-In',
                bgColor: AppColors.blue4,
                textColor: AppColors.white1,
              )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account?",
                      style: GoogleFonts.poppins(
                          color: AppColors.white1,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    NavTextButton(
                        text: "Sign In",
                        color: AppColors.blue4,
                        onTap: (){
                          // authController.nav_to_SignIn(context);
                          Get.toNamed('SignInView');
                        }
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    AppText(
                      text: "Sign Up With",
                      fontSize: 14,
                    ),
                    ContainerButton(
                      onTap: () {},
                      bgColor: AppColors.white1,
                      iconPath: AppImages.apple_logo,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      width: 50,
                    ),
                    ContainerButton(
                      onTap: () {},
                      bgColor: AppColors.white1,
                      iconPath: AppImages.google_logo,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}