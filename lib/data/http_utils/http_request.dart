import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/api_response.dart';
import 'http_response_handler.dart';

abstract class HttpCustomRequest with HttpResponseHandlerMixin {
  static const String jsonMimeType = 'application/json';
  static const String bearerTokenPrefix = 'Bearer ';

  Future<ApiResponse> sendRequest({
    required String url,
    String? token,
    Map<String, dynamic> body = const {},
    required String method,
  }) async {
    final ApiResponse apiResponse = ApiResponse();

    final Map<String, String> headers = {
      "Accept": jsonMimeType,
      if (token != null) "Authorization": "$bearerTokenPrefix$token",
      'Content-Type': 'application/json',
    };

    http.Response response;

    switch (method) {
      case 'GET':
        response = await performGetRequest(url, headers).onError(handleError);
        break;
      case 'POST':
        response = await performPostRequest(url, headers, body).onError(handleError);
        break;
      case 'PATCH':
        response = await performPatchRequest(url, headers, body).onError(handleError);
        break;
      case 'DELETE':
        response = await performDeleteRequest(url, headers, body).onError(handleError);
        break;
      case 'PUT':
        response = await performPutRequest(url, headers, body).onError(handleError);
        break;
      default:
        throw Exception('Unsupported HTTP method: $method');
    }
    handleResponse(apiResponse, response);

    return apiResponse;
  }

  Future<http.Response> performGetRequest(
    String url,
    Map<String, String> headers,
  ) {
    return http
        .get(
          Uri.parse(url),
          // headers: headers,
        )
        .timeout(
          const Duration(
            seconds: 60,
          ),
          onTimeout: () => handleError("Error", null),
        );
  }

  Future<http.Response> performPostRequest(
    String url,
    Map<String, String> headers,
    Map<String, dynamic> body,
  ) {
    return http
        .post(
          Uri.parse(url),
          headers: headers,
          body: json.encode(body),
        )
        .timeout(
          const Duration(
            seconds: 60,
          ),
          onTimeout: () => handleError("Error", null),
        );
  }

  Future<http.Response> performPatchRequest(
    String url,
    Map<String, String> headers,
    Map<String, dynamic> body,
  ) {
    return http
        .patch(
          Uri.parse(url),
          headers: headers,
          body: json.encode(body),
        )
        .timeout(
          const Duration(
            seconds: 60,
          ),
          onTimeout: () => handleError("Error", null),
        );
  }

  Future<http.Response> performDeleteRequest(
    String url,
    Map<String, String> headers,
    Map<String, dynamic> body,
  ) {
    return http
        .delete(
          Uri.parse(url),
          headers: headers,
          body: json.encode(body),
        )
        .timeout(
          const Duration(
            seconds: 60,
          ),
          onTimeout: () => handleError("Error", null),
        );
  }

  Future<http.Response> performPutRequest(
    String url,
    Map<String, String> headers,
    Map<String, dynamic> body,
  ) {
    return http
        .put(
          Uri.parse(url),
          headers: headers,
          body: json.encode(body),
        )
        .timeout(
          const Duration(
            seconds: 60,
          ),
          onTimeout: () => handleError("Error", null),
        );
  }
}
