import 'package:doit/common/widgets/app_text.dart';
import 'package:doit/common/widgets/gradient_background.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GradientBackground(
        child: Center(
          child: AppText(text: 'Setting',fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}
