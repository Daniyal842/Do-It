import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ContainerButton extends StatefulWidget {
  final VoidCallback onTap;
  final String? text;
  final Color bgColor;
  final Color ?textColor;
  final Color? iconColor;
  final String? iconPath;
  final IconData? iconData;
  final double? iconSize;
  final double? textSize;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;

  const ContainerButton({
    super.key,
    required this.onTap,
    this.text,
    required this.bgColor,
    this.textColor,
    this.iconColor,
    this.iconPath,
    this.iconData,
    this.iconSize,
    this.textSize,
    this.padding,
    this.borderRadius,
    this.margin,
    this.width,
    this.height,
  });

  @override
  State<ContainerButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<ContainerButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width ?? 200,
        height: widget.height ?? 50,
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 12),
        margin: widget.margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _isPressed ? widget.bgColor.withOpacity(0.7) : widget.bgColor,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: _isPressed ? 2 : 8,
              offset: _isPressed ? const Offset(1, 1) : const Offset(4, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.iconPath != null) ...[
              Image.asset(
                widget.iconPath!,
                width: widget.iconSize ?? 20,
                height: widget.iconSize ?? 20,
                color: widget.iconColor,
              ),
              const SizedBox(width: 8),
            ],
            if (widget.iconData != null) ...[
              Icon(
                widget.iconData,
                size: widget.iconSize ?? 20,
                color: widget.iconColor ?? widget.textColor,
              ),
              const SizedBox(width: 8),
            ],
            if (widget.text != null)
              // CustomText(
              //   text: widget.text!,
              //   color: widget.textColor,
              //   fontSize: widget.textSize ?? 16,
              //   fontWeight: FontWeight.normal,
              // ),
              Text(
                widget.text!,
                style: GoogleFonts.poppins(
                  color: widget.textColor?? AppColors.white1,
                  fontSize: widget.textSize??16,
                  fontWeight: FontWeight.normal,
                ),
              )
          ],
        ),
      ),
    );
  }
}

