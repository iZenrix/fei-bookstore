import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../routes/route_name.dart';
import '../models/api_response.dart';

mixin HttpResponseHandlerMixin {
  void handleResponse(ApiResponse apiResponse, http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        apiResponse.data = response.body.isNotEmpty
            ? json.decode(response.body)['books'] ?? json.decode(response.body)['error']
            : null;
        break;
      case 422:
      case 403:
      case 429:
      case 400:
        apiResponse.error = response.body.isNotEmpty
            ? json.decode(response.body)['error']
            : 'Something went wrong';
        break;
      case 401:
        Get.offAllNamed(RouteName.homeView);
        break;
      default:
        apiResponse.error = "Ada masalah Server...";
        break;
    }
  }

  FutureOr<http.Response> handleError(dynamic error, StackTrace? stackTrace) {
    return http.Response(
      json.encode({'message': 'Ada masalah koneksi internet...'}),
      400,
    );
  }

}
