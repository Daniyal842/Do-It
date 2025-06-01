import 'package:doit/app_views/starting_views/splash_view/splash-view.dart';
import 'package:doit/assets/app_icons/app-icons.dart';
import 'package:doit/components/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignView extends StatefulWidget {
  const SignView({super.key});

  @override
  State<SignView> createState() => _SignViewState();
}

class _SignViewState extends State<SignView> {
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
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(50),
                  child: ImageIcon(
                    AssetImage(AppIcons.checkmark),
                    size: 100,
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
                InkWell(
                  onTap: () async {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text);
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
