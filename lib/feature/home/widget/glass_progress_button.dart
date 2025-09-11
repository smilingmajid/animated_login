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
      Color bgColor = Colors.white.withOpacity(.25);

      double width = 200;
      double borderRadius = 15;

      switch (controller.state.value) {
        case ButtonState.idle:
          text = "Send";
          icon = Icons.send;
          break;

        case ButtonState.loading:
          text = "";
          width = 65; // دکمه گرد
          borderRadius = 100;
          break;

        case ButtonState.success:
          text = "Success";
          icon = Icons.check_circle;
          bgColor = Colors.green.withOpacity(.4);
          break;
      }

      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: InkWell(
            onTap: controller.onPressed,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: 65,
              width: width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: controller.state.value == ButtonState.loading
                  ? const SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null)
                          Icon(icon, color: Colors.white.withOpacity(.9)),
                        if (text.isNotEmpty) ...[
                          const SizedBox(width: 8),
                          Text(
                            text,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white.withOpacity(.9),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ],
                    ),
            ),
          ),
        ),
      );
    });
  }
}
