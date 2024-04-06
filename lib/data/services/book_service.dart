import '../../core/values/url.dart';
import '../http_utils/http_request.dart';
import '../models/api_response.dart';

class BookService extends HttpCustomRequest {

  Future<ApiResponse> getBooksBySearch() async {
    return sendRequest(url: "$searchBookUrl/flutter", method: 'GET');
  }

  Future<ApiResponse> getNewBooks() async {
    return sendRequest(url: newBooksUrl, method: 'GET');
  }
}