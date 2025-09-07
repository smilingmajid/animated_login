import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icons_plus/icons_plus.dart';

import 'cicrcle_glass_botton.dart';
  

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  final List<Map<String, dynamic>> buttons = const [
    {
      'icon': Bootstrap.google,
      'msg': 'Google button pressed',
    },
    {
      'icon': Bootstrap.facebook,
      'msg': 'Facebook button pressed',
    },
    {
      'icon': Bootstrap.apple,
      'msg': 'Apple button pressed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(buttons.length, (index) {
        final button = buttons[index];
        return Row(
          children: [
            CircleGlassButton(
              icon: button['icon'],
              widthFactor: 4,
              onTap: () {
                HapticFeedback.lightImpact();
                Fluttertoast.showToast(msg: button['msg']);
              },
            ),
            if (index != buttons.length - 1) const SizedBox(width: 8),
          ],
        );
      }),
    );
  }
}
