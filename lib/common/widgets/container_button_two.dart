import 'package:doit/common/constants/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerButtonTwo extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color iconColor;

  const ContainerButtonTwo({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.iconColor,
  });

  @override
  State<ContainerButtonTwo> createState() => _ContainerButtonTwoState();
}

class _ContainerButtonTwoState extends State<ContainerButtonTwo> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: 71,
        width: 88,
        decoration: BoxDecoration(
          color: AppColors.blue2,
          borderRadius: BorderRadius.circular(10),
          boxShadow: _isPressed
              ? [
            // Press hone par shadow halki aur opposite lage
            BoxShadow(
              color: AppColors.white1.withOpacity(0.7),
              offset: Offset(-2, -2),
              blurRadius: 6,
            ),
          ]
              : [
            // Normal shadow
            BoxShadow(
              color: AppColors.white1,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: widget.iconColor,
              size: 30,
            ),
            SizedBox(height: 6),
            Text(
              widget.text,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
