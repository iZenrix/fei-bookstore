import 'package:fei_bookstore/data/models/single_book.dart';
import 'package:get/get.dart';
import '../../data/models/api_response.dart';
import '../../data/services/book_service.dart';

class SingleBookController extends GetxController {
  Rx<SingleBook?> book = Rx<SingleBook?>(null);
  String? args;

  @override
  void onInit() async {
    getArguments();
    await getBookByIsbn(args!);
    super.onInit();
  }

  void getArguments() {
    if (Get.arguments != null) {
      args = Get.arguments as String;
    }
  }

  Future<void> getBookByIsbn(String isbn) async {
    ApiResponse response = ApiResponse();
    try {
      response = await BookService().getBookByIsbn(isbn);
      if (response.isResponseSuccess()) {
        book.value = SingleBook.fromJson(response.data as Map<String, dynamic>);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}