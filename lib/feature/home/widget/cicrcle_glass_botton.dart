import 'dart:ui';
import 'package:flutter/material.dart';

class CicrcleGlassButton extends StatelessWidget {
  final double widthFactor;
  final VoidCallback onTap;
  final IconData icon;
  const CicrcleGlassButton({
    super.key,
    required this.icon,
    required this.widthFactor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            height: size.width / 8,
            width: size.width / 8,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            // ignore: deprecated_member_use
            child: Icon(icon, color: Colors.white.withOpacity(.8)),
          ),
        ),
      ),
    );
  }
}
