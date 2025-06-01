import 'package:doit/app_views/auth_views/sign_view/sign-view.dart';
import 'package:doit/app_views/starting_views/splash_view/splash-view.dart';
import 'package:doit/starting_views/splash_view/splash-view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignView()
    );
  }
}
