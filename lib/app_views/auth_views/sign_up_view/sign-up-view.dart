import 'package:doit/app_views/auth_views/sign_in_view/sign-in-view.dart';
import 'package:doit/assets/app_icons/app-icons.dart';
import 'package:doit/assets/app_images/app-images.dart';
import 'package:doit/components/app-colors.dart';
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
                    "create an account and join us now",
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
                      style: GoogleFonts.poppins(
                          color: AppColors.black1,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                            size: 30,
                          ),
                          iconColor: AppColors.black1,
                          hintText: 'Full Name',
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
                      controller: emailController,
                      style: GoogleFonts.poppins(
                          color: AppColors.black1,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.email),
                        iconColor: AppColors.black1,
                        hintText: 'E-mail',
                        hintStyle: GoogleFonts.poppins(
                            color: AppColors.grey1,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white1,
                    ),
                    child: TextFormField(
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
                      ),
                    ),
                  ),
                  isloading?CircularProgressIndicator():
                  InkWell(
                    onTap: () async {
                      isloading = true;
                      setState(() {});
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text)
                          .then((onValue) {
                        isloading = false;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInView()));
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
                          "sign in",
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
                          "Already have an account",
                          style: GoogleFonts.poppins(
                              color: AppColors.white1,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          child: Text(
                            "sign in",
                            style: GoogleFonts.poppins(
                                color: AppColors.blue4,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInView()));
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
                          "Sign Up With:",
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