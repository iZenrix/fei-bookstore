import 'package:fei_bookstore/data/models/single_book.dart';
import 'package:get/get.dart';

import '../../data/models/api_response.dart';
import '../../data/services/book_service.dart';

class SingleBookController extends GetxController{
  SingleBook? book;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getBookByIsbn("9781617294136");
  }

  Future<void> getBookByIsbn(String isbn) async {
    ApiResponse response = ApiResponse();
    try {
      response = await BookService().getBookByIsbn(isbn);
      if (response.isResponseSuccess()) {
        book = SingleBook.fromJson(response.data as Map<String, dynamic>);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}