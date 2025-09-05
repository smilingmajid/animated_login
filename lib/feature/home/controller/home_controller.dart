import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> anim1;
  late Animation<double> anim2;
  late Animation<double> anim3;
  late Animation<double> anim4;

  @override
  void onInit() {
    super.onInit();

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    anim1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(parent: controller1, curve: Curves.easeInOut),
    )..addStatusListener(_repeatController1);

    anim2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(parent: controller1, curve: Curves.easeInOut),
    );

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    anim3 = Tween<double>(begin: .41, end: .38).animate(
      CurvedAnimation(parent: controller2, curve: Curves.easeInOut),
    )..addStatusListener(_repeatController2);

    anim4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(parent: controller2, curve: Curves.easeInOut),
    );

    Timer(const Duration(milliseconds: 2500), () => controller1.forward());
    controller2.forward();
  }

  void _repeatController1(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller1.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller1.forward();
    }
  }

  void _repeatController2(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller2.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller2.forward();
    }
  }

  @override
  void onClose() {
    controller1.dispose();
    controller2.dispose();
    super.onClose();
  }
}
