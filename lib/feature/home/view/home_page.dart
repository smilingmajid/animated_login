import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controller/button_controller.dart';
import '../controller/home_controller.dart';
import '../widget/build_background.dart';
import '../widget/build_content_widget.dart';


class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Get.put(ButtonController());

    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          controller.controller1,
          controller.controller2,
        ]),
        builder: (context, _) {
          return SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  buildBackground(size, controller),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: // contentWidget(),
                        buildContentWidget(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

