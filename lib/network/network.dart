import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetWork {
  final String _baseUrl = 'http://smith-restaurants.com/api/';

  Dio dio = Dio();

  Future<dynamic> getData({String url}) async {
    final token = (await SharedPreferences.getInstance()).getString("token");

    var jsonResponse;
    dio.options.baseUrl = _baseUrl;
    dio.options.headers['Authorization'] = token.toString();

    try {
      final response = await dio.get('/$url');
      jsonResponse = _handelResponse(response);
    } on DioError catch (e) {
      if (DioErrorType.DEFAULT == e.type) {
        if (e.message.contains('SocketException')) {
          return jsonResponse = 'internet';
        }
      }
    }
    return jsonResponse;
  }

  Future<dynamic> postData({
    FormData formData,
    Map<String, dynamic> headers,
    String url,
  }) async {
    dio.options.baseUrl = _baseUrl;
    headers != null
        ? dio.options.headers = headers
        : dio.options.headers.clear();

    var jsonResponse;

    try {
      Response response = await dio.post(
        url,
        data: formData,
      );
      jsonResponse = json.decode(response.toString()) as Map<String, dynamic>;
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //jsonResponse = json.decode(response.toString());
        return response.data;
      } else if (response == null) {
        return response;
      } else {
        return response;
      }
    } on DioError catch (e) {
      if (DioErrorType.DEFAULT == e.type) {
        if (e.message.contains('SocketException')) {
          return jsonResponse = 'internet';
        }
      }
    }
  }

  dynamic _handelResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.toString());
        return responseJson;
      case 400:
        var jsonResponse = 'unauth';
        return jsonResponse;
      case 401:
        var jsonResponse = 'هذا الايميل مستخدم من قبل';
        return jsonResponse;
      case 403:
        var jsonResponse = 'unauth';
        return jsonResponse;
      case 500:
        var jsonResponse = 'server error';
        return jsonResponse;

      default:
        var jsonResponse = 'server error';
        return jsonResponse;
    }
  }
}
