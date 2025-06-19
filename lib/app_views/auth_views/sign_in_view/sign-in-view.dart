import 'package:doit/app_views/auth_views/sign_up_view/sign-up-view.dart';
import 'package:doit/app_views/home_view/home-view.dart';
import 'package:doit/app_views/starting_views/splash_view/splash-view.dart';
import 'package:doit/assets/app_icons/app-icons.dart';
import 'package:doit/assets/app_images/app-images.dart';
import 'package:doit/components/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isloading = false;
  bool isHide = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.1,
                        0.9
                      ],
                      colors: [
                        // Color(0xff1253AA),
                        // Color(0xff05243E)
                        AppColors.blue1,
                        AppColors.blue2,
                      ]),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: ImageIcon(
                      AssetImage(AppIcons.checkmark),
                      size: 80,
                      color: AppColors.white1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Back to ",
                        style: GoogleFonts.poppins(
                            color: AppColors.white1,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
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
                  Text(
                    "Have an other productive day ! ",
                    style: GoogleFonts.poppins(
                        color: AppColors.white1,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white1,
                    ),
                    child: TextField(
                      controller: emailController,
                      style: GoogleFonts.poppins(
                          color: AppColors.black1,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.email,
                            size: 30,
                          ),
                          iconColor: AppColors.black1,
                          hintText: 'E-mail',
                          hintStyle: GoogleFonts.poppins(
                              color: AppColors.grey1,
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white1,
                    ),
                    child: TextFormField(
                      obscureText: isHide,
                      controller: passwordController,
                      style: GoogleFonts.poppins(
                          color: AppColors.black1,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.lock),
                          iconColor: AppColors.black1,
                          hintText: 'Password',
                          hintStyle: GoogleFonts.poppins(
                              color: AppColors.grey1,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                          suffixIconColor: AppColors.blue3,
                          suffixIcon: IconButton(
                            icon: isHide
                                ? ImageIcon(
                                    AssetImage(AppIcons.close_eye),
                                    size: 24,
                                  )
                                : Icon(
                                    Icons.remove_red_eye_outlined,
                                  ),
                            onPressed: () {
                              if (isHide == true) {
                                isHide = false;
                              } else {
                                isHide = true;
                              }
                              setState(() {});
                            },
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text(
                          "forget password?",
                          style: GoogleFonts.poppins(
                              color: AppColors.white1,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.white1,
                              decorationThickness: 2),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  isloading
                      ? CircularProgressIndicator()
                      : InkWell(
                          onTap: () async {
                            isloading = true;
                            setState(() {});
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text.trim(),
                                    password: passwordController.text)
                                .then((onValue) {
                              isloading = false;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()));
                              setState(() {});
                            }).onError((handleError, error) {
                              isloading = false;
                              setState(() {});
                              Get.snackbar('Error', handleError.toString());
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            height: 42,
                            decoration: BoxDecoration(
                              color: AppColors.blue3,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "sign In",
                                style: GoogleFonts.poppins(
                                    color: AppColors.white1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.poppins(
                              color: AppColors.white1,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.poppins(
                                color: AppColors.blue4,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpView()));
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Sign In With:",
                          style: GoogleFonts.poppins(
                            color: AppColors.white1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: AppColors.white1,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(AppImages.apple_logo),
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: AppColors.white1,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(AppImages.google_logo),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
