import 'package:doit/app_views/auth_views/sign_in_view/sign-in-view.dart';
import 'package:doit/app_views/home_view/home-view.dart';
import 'package:doit/assets/app_icons/app-icons.dart';
import 'package:doit/components/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInView()));
      islogin();
    });
  }
  islogin()async
  {
    User user=await FirebaseAuth.instance.currentUser!;
    if(user==null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInView()));
      }
    else
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView()));
      }
  }
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
                      stops: [0.1,0.9],
                      colors: [
                        // Color(0xff1253AA),
                        // Color(0xff05243E)
                        AppColors.blue1,
                        AppColors.blue2,
                      ]
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
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
            )
          ],
        ),
      ),
    );
  }
}
