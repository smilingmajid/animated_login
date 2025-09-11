import 'package:flutter/material.dart';


import 'glass_button.dart';
import 'glass_progress_button.dart';
import 'register_form.dart';
import 'social_buttons_row.dart';

Widget buildContentWidget(
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

      GlassProgressButton(),

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
            
            },
          ),
          SizedBox(
            height: 20,
            //size.height * .05
          ),
          // GlassProgressButton(),
        ],
      ),
    ],
  );
}
