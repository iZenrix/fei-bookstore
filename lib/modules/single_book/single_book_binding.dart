import 'package:get/get.dart';
import 'single_book_controller.dart';

class SingleBookBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SingleBookController());
  }
}