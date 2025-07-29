import 'package:doit/app_views/auth_views/sign_in_view/sign-in-view.dart';
import 'package:doit/app_views/auth_views/sign_up_view/singup_2_screen.dart';
import 'package:doit/app_views/home_view/home-view.dart';
import 'package:doit/app_views/starting_views/splash_view/splash-view.dart';
import 'package:doit/fetch-data.dart';
import 'package:doit/insert-data.dart';
import 'package:doit/starting_views/onbording_views/onbording-view.dart';
import 'package:doit/update-data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
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
      debugShowCheckedModeBanner: false,
      home: SingupScreen()
    );
  }
}
