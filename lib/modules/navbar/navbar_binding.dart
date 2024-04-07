import 'package:get/get.dart';
import 'navbar_controller.dart';

class NavbarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavbarController());
  }
}