import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'input_field.dart'; 
 
import 'glass_button.dart'; 
 

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const InputField(
          icon: IconlyLight.profile,
          hintText: 'User name...',
        ),
        const SizedBox(height: 16),

        const InputField(
          icon: IconlyLight.message,
          hintText: 'Email...',
          isEmail: true,
        ),
        const SizedBox(height: 16),

        const InputField(
          icon: IconlyLight.lock,
          hintText: 'Password...',
          isPassword: true,
        ),
        const SizedBox(height: 32),

        GlassButton(
          text: 'Create a new Account',
          widthFactor: 1.2,
          onTap: () {
            HapticFeedback.lightImpact();
            Fluttertoast.showToast(msg: 'Register button pressed');
          },
        ),
      ],
    );
  }
}
