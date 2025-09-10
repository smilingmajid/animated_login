import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../widget/build_background.dart';
import '../widget/glass_button.dart';

import '../widget/register_form.dart';
import '../widget/social_buttons_row.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                    child: contentWidget(),
                    //_buildContent(),
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

Widget contentWidget() {
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: 1600,
          width: 800,
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white, width: 0.5),
          ),
          child: Column(
            children: [
              Spacer(),
              Text(
                'animated login',
                style: TextStyle(
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(.7),
                  fontSize: 30,
                  fontFamily: 'ClashDisplay',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  wordSpacing: 4,
                ),
              ),
              Spacer(),
              RegisterForm(),
              Spacer(),
            ],
          ),
        ),
      ),
    ),
  );
}
/*
  Widget _buildContent(
    //Size size
  ) {
    return Column(
      children: [
        Spacer(),
        Text(
          'animated login',
          style: TextStyle(
            // ignore: deprecated_member_use
            color: Colors.white.withOpacity(.7),
            fontSize: 30,
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            wordSpacing: 4,
          ),
        ),
        Spacer(),
        RegisterForm(),
        SizedBox(height: 32),

        GlassButton(
          text: 'Create a new Account',
          widthFactor: 1.2,
          onTap: () {
            HapticFeedback.lightImpact();
            Fluttertoast.showToast(msg: 'Register button pressed');
          },
        ),

        SizedBox(height: 32),
        Divider(
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(.2),
          indent: 50,
          endIndent: 50,
          thickness: 3,
        ),
        SizedBox(height: 32),
        SocialButtonsRow(),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GlassButton(
              text: 'Login',
              widthFactor: 2,
              onTap: () {
                HapticFeedback.lightImpact();
                Fluttertoast.showToast(
                  msg: 'Create a new account button pressed',
                );
              },
            ),
            SizedBox(
              height: 20,
              //size.height * .05
            ),
          ],
        ),
      ],
    );
  }
}
*/