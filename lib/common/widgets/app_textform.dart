import 'package:doit/common/constants/app-colors.dart';
import 'package:flutter/material.dart';


class AppTextForm extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  // ✅ New optional params
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? iconColor;
  final double borderRadius;
  final Color fillColor;
  final Color hintColor;
  final Color textColor;
  final Color cursorColor;
  final EdgeInsetsGeometry contentPadding;

  const AppTextForm({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.iconColor,
    this.borderRadius = 12,
    this.fillColor = Colors.transparent,
    this.hintColor = Colors.grey,
    this.textColor=Colors.black,
    this.cursorColor = AppColors.black1,
    this.contentPadding =
    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      cursorColor: cursorColor,
      style:  TextStyle(color: textColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        filled: true,
        fillColor: fillColor,
        contentPadding: contentPadding,

        // ✅ Optional prefix/suffix icons
        // ✅ Hamesha show hoga (multi-line included)
        prefixIcon:  prefixIcon,
        suffixIcon: suffixIcon,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: AppColors.black1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: AppColors.white1),
        ),
      ),
    );
  }
}
