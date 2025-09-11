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
      Color bgColor = Colors.white.withOpacity(.25);

      double width = 500;
      double borderRadius = 15;

      switch (controller.state.value) {
        case ButtonState.idle:
          text = "Create a New Account";
          icon = null;
          break;

        case ButtonState.loading:
          text = "";
          width = 65; // دکمه دایره‌ای
          borderRadius = 100;
          break;

        case ButtonState.success:
          text = "Account has been successfully created";
          icon = Icons.check_circle;
          bgColor = Colors.green;
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
                // ignore: deprecated_member_use
                color: bgColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              // ✅ وقتی Loading هست، فقط ProgressIndicator نشون بده
              child:
                  controller.state.value == ButtonState.loading
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
                        mainAxisSize: MainAxisSize.min, // فقط به اندازه محتوا
                        children: [
                          if (icon != null)
                            // ignore: deprecated_member_use
                            Icon(icon, color: bgColor.withOpacity(.9)),
                          if (text.isNotEmpty) ...[
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                text,
                                overflow:
                                    TextOverflow
                                        .ellipsis, // متن طولانی بریده نشه
                                style: TextStyle(
                                  fontSize: 18,
                                  // ignore: deprecated_member_use
                                  color: bgColor.withOpacity(.9),
                                  fontWeight: FontWeight.w500,
                                ),
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
