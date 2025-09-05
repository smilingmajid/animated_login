import 'package:get/get.dart';

import '../../feature/home/binding/home_binding.dart';
import '../../feature/home/view/home_page.dart';

class AppRoutes {
  static const String home = '/home';

  static final pages = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
