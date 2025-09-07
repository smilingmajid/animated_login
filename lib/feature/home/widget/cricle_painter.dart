import 'package:flutter/widgets.dart';

class CirclePainter extends CustomPainter {
  final double radius;

  const CirclePainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..shader = const LinearGradient(
            colors: [
              Color(
                0xfffec303, //FD5E3D
              ),
              Color.fromARGB(255, 250, 64, 2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(Rect.fromCircle(center: Offset.zero, radius: radius));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CirclePainter oldDelegate) {
    return oldDelegate.radius != radius;
  }
}
