import 'package:doit/common/widgets/app_text.dart';
import 'package:doit/common/widgets/gradient_background.dart';
import 'package:flutter/material.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: AppText(text: 'Calender',fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}
