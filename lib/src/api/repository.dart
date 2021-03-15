//importing pacakges
import 'dart:io';

import 'package:dio/dio.dart';

class Repository {
  static Future<Response> postRequest(
      String url, Map<String, dynamic> data) async {
    final response = await Dio().post(
      url,
      data: data,
    );
    return response;
  }

  static Future<Response> getRequest({
    required String url,
    required String token,
  }) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Bearer $token";
    final response = await dio.get(url);
    return response;
  }
}
