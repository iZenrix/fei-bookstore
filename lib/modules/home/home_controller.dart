import 'package:fei_bookstore/data/models/api_response.dart';
import 'package:get/get.dart';

import '../../data/models/books_model.dart';
import '../../data/services/book_service.dart';

class HomeController extends GetxController{

  RxList<Book> newBooks = <Book>[].obs;

  @override
  void onInit() async {
    super.onInit();
    // TODO: implement onInit
    await getNewBooks();
  }

 Future<void> getNewBooks() async {
    ApiResponse response = ApiResponse();
    try {
      response = await BookService().getNewBooks();
      if (response.isResponseSuccess()) {
        var book = response.data as List<dynamic>;
        newBooks.assignAll(book.map((e) => Book.fromJson(e)).toList());
      }
      print(newBooks);
    } catch (e) {
      print(e);
    }
  }
}