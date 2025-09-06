import 'dart:ui';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;

  const InputField({
    super.key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 65,
          // width: size.width / 1.2,
          // padding: EdgeInsets.only(right: size.width / 30),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            obscureText: isPassword,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.text,
            cursorColor: Colors.white,
            // ignore: deprecated_member_use
            style: TextStyle(color: Colors.white.withOpacity(.8)),
            decoration: InputDecoration(
              // ignore: deprecated_member_use
              prefixIcon: Icon(icon, color: Colors.white.withOpacity(.7)),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14,
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
