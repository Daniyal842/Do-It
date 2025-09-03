import 'package:doit/common/widgets/app_text.dart';
import 'package:flutter/material.dart';


class NavTextButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final VoidCallback onTap;

  const NavTextButton({
    super.key,
    required this.text,
    this.fontSize = 16,
    required this.color,
    this.fontWeight = FontWeight.normal,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: AppText(
        text: text,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
