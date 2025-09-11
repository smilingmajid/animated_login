import 'package:get/get.dart';
import 'dart:math';

enum ButtonState { idle, loading, success, fail }

class ButtonController extends GetxController {
  var state = ButtonState.idle.obs;

  void onPressed() {
    switch (state.value) {
      case ButtonState.idle:
        state.value = ButtonState.loading;
        Future.delayed(const Duration(seconds: 1), () {
          state.value = Random().nextBool()
              ? ButtonState.success
              : ButtonState.fail;
        });
        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        state.value = ButtonState.idle;
        break;
      case ButtonState.fail:
        state.value = ButtonState.idle;
        break;
    }
  }
}
