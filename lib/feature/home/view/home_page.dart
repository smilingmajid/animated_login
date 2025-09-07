import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../widget/build_background.dart';
import '../widget/glass_button.dart';
import '../widget/input_field.dart';
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
                    child: _buildContent(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

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
        const InputField(icon: IconlyLight.profile, hintText: 'User name...'),
        SizedBox(height: 16),
        const InputField(
          icon: IconlyLight.message,
          hintText: 'Email...',
          isEmail: true,
        ),
        SizedBox(height: 16),
        const InputField(
          icon: IconlyLight.lock,
          hintText: 'Password...',
          isPassword: true,
        ),
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
