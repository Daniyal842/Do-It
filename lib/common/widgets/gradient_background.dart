import 'package:doit/common/constants/app-colors.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: double.infinity,
      width: double.infinity,
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
      child: child,
    );
  }
}
