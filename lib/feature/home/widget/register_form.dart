import 'package:flutter/material.dart';

import 'package:flutter_iconly/flutter_iconly.dart';

import 'input_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const InputField(icon: IconlyLight.profile, hintText: 'User name...'),
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
      ],
    );
  }
}
