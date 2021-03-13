//importing pacakges
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
}
