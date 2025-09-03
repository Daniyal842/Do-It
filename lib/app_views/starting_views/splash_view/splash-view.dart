
import 'package:doit/app_views/auth_views/sign_in_view/sign-in-view.dart';
import 'package:doit/app_views/home_view/home-view.dart';
import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/constants/app-icons.dart';
import 'package:doit/common/widgets/app_text.dart';
import 'package:doit/common/widgets/gradient_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      Get.toNamed('/OnboardingView');
      islogin();
    });
  }
  islogin()async
  {
    User user=await FirebaseAuth.instance.currentUser!;
    if(user==null)
      {
        Get.offNamed('/SignInView');
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInView()));
      }
    else
      {
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView()));
        Get.offNamed('/BottomBar');
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child:  Column(
          children: [
            SizedBox(
              height: 150,
            ),
            ImageIcon(
              AssetImage(AppIcons.checkmark),
              size: 100,
              color: AppColors.white1,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Do It",style: GoogleFonts.darumadropOne(
                color: AppColors.white1,
                fontSize: 36,
                fontWeight: FontWeight.w400
            ),),
            SizedBox(
              height: 120,
            ),
            Text("v 1.0.0",style: GoogleFonts.poppins(
                color: AppColors.white1,
                fontSize: 20,
                fontWeight: FontWeight.w500
            ),)
          ],
        ),
      ),
    );
  }
}
