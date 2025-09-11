import 'package:get/get.dart';

import '../view/success_page.dart';

enum ButtonState { idle, loading, success }

class ButtonController extends GetxController {
  var state = ButtonState.idle.obs;

  void onPressed() {
    switch (state.value) {
      case ButtonState.idle:
        state.value = ButtonState.loading;

        Future.delayed(const Duration(seconds: 1), () {
          state.value = ButtonState.success;

          /// انتقال به صفحه موفقیت
          Future.delayed(const Duration(milliseconds: 500), () {
            Get.to(() => const SuccessPage());
          });
        });
        break;

      case ButtonState.loading:
        break;

      case ButtonState.success:
        state.value = ButtonState.idle;
        break;
    }
  }
}
