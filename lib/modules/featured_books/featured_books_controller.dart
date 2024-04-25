import 'package:get/get.dart';

import '../../data/models/api_response.dart';
import '../../data/models/books_model.dart';
import '../../data/services/book_service.dart';

class FeaturedBooksController extends GetxController {
  RxList<Book> featuredBooks = <Book>[].obs;
  String? args;

  @override
  void onInit() {
    getArguments();
    getFeaturedBooks(args ?? "");
    print("FeaturedBooksController");
    super.onInit();
  }

  void getArguments() {
    if (Get.arguments != null) args = Get.arguments as String;
  }

  Future<void> getFeaturedBooks(String content) async {
    ApiResponse response = ApiResponse();
    try {
      response = await BookService().getBooksBySearch(content);
      if (response.isResponseSuccess()) {
        var book = response.data as List<dynamic>;
        featuredBooks.assignAll(book.map((e) => Book.fromJson(e)).toList());
        print(featuredBooks.toJson());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}