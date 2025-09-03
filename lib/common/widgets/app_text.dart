import 'package:doit/common/constants/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final String fontFamily;

  const AppText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight = FontWeight.w600,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
    this.fontFamily = 'Poppins',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: align,
      overflow: overflow,
      style: GoogleFonts.getFont(
        fontFamily,
        fontSize: fontSize??24,
        fontWeight: fontWeight,
        color: color??AppColors.white1,
      ),
    );
  }
}