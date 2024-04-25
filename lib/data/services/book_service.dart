import 'dart:convert';
import '../../core/values/url.dart';
import '../http_utils/http_request.dart';
import '../models/api_response.dart';
import 'package:http/http.dart' as http;

class BookService extends HttpCustomRequest {
  Future<ApiResponse> getBooksBySearch(String content) async {
    return sendRequest(url: "$searchBookUrl/$content", method: 'GET');
  }

  Future<ApiResponse> getNewBooks() async {
    return sendRequest(url: newBooksUrl, method: 'GET');
  }

  Future<ApiResponse> getBookByIsbn(String id) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.get(
        Uri.parse(
          "$bookDetailUrl/$id",
        ),
        headers: {
          'Accept': 'Application/json',
        },
      );
      if (response.statusCode == 200) {
        apiResponse.data = jsonDecode(response.body);
      } else {
        apiResponse.error = jsonDecode(response.body)['error'];
      }
      return apiResponse;
    } catch (err) {
      rethrow;
    }
  }
}
