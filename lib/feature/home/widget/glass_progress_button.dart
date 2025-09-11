import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/button_controller.dart';


class GlassProgressButton extends StatelessWidget {
  const GlassProgressButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ButtonController>();

    return Obx(() {
      String text = "";
      IconData? icon;
      // ignore: deprecated_member_use
      Color color = Colors.white.withOpacity(.25);

      switch (controller.state.value) {
        case ButtonState.idle:
          text = "Send";
          icon = Icons.send;
          break;
        case ButtonState.loading:
          text = "Loading...";
          icon = Icons.hourglass_empty;
          break;
        case ButtonState.success:
          text = "Success";
          icon = Icons.check_circle;
          break;
        case ButtonState.fail:
          text = "Failed";
          icon = Icons.cancel;
          break;
      }

      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: InkWell(
            onTap: controller.onPressed,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: 65,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (controller.state.value == ButtonState.loading)
                    const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  else
                    // ignore: deprecated_member_use
                    Icon(icon, color: Colors.white.withOpacity(.8)),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
