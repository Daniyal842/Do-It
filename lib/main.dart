import 'package:doit/app_views/auth_views/sign_in_view/sign-in-view.dart';
import 'package:doit/app_views/auth_views/sign_up_view/sign-up-view.dart';
import 'package:doit/app_views/home_view/home-view.dart';
import 'package:doit/app_views/setting_view/setting_view.dart';
import 'package:doit/app_views/starting_views/onboarding_view/onboarding_view.dart';
import 'package:doit/app_views/starting_views/splash_view/splash-view.dart';
import 'package:doit/app_views/task_view/task_view.dart';
import 'package:doit/app_views/time_view/time_view.dart';
import 'package:doit/common/bottom_bar/bottom_bar.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black,),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>SplashView()),
        GetPage(name: '/OnboardingView', page: ()=>OnboardingView()),
        GetPage(name: '/SignInView', page: ()=>SignInView()),
        GetPage(name: '/SignUpView', page: ()=>SignUpView()),
        GetPage(name: '/BottomBar', page: ()=>BottomBar()),
        GetPage(name: '/HomeView', page: ()=>HomeView()),
        GetPage(name: '/TaskPage', page: ()=>TaskPage()),
        GetPage(name: '/TimeView', page: ()=>TimeView()),
        GetPage(name: '/SettingView', page: ()=>SettingView()),
      ],
    );
  }
}

