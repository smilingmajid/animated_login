import 'package:flutter/widgets.dart';

Widget buildBackground(Size size) {
    return Stack(
      children: [
        Positioned(
          top: size.height * (controller.anim2.value + .58),
          left: size.width * .21,
          child: const CustomPaint(painter: CirclePainter(50)),
        ),
        Positioned(
          top: size.height * .98,
          left: size.width * .1,
          child: CustomPaint(
            painter: CirclePainter(controller.anim4.value - 30),
          ),
        ),
        Positioned(
          top: size.height * .5,
          left: size.width * (controller.anim2.value + .8),
          child: const CustomPaint(painter: CirclePainter(30)),
        ),
        Positioned(
          top: size.height * controller.anim3.value,
          left: size.width * (controller.anim1.value + .1),
          child: const CustomPaint(painter: CirclePainter(60)),
        ),
        Positioned(
          top: size.height * .1,
          left: size.width * .8,
          child: CustomPaint(painter: CirclePainter(controller.anim4.value)),
        ),
      ],
    );
  }
