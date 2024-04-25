import 'package:get/get.dart';
import 'featured_books_controller.dart';

class FeaturedBooksBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FeaturedBooksController());
  }
}