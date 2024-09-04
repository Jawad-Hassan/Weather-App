import 'package:get/instance_manager.dart';

import '../home_screen/logic.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(city: 'lahore'));
  }
}
