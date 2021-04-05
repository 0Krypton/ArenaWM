//importing class
import '../repository.dart';

const String url = 'http://localhost:3000/api/v1';
const String token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwNjJkNjhmNGNlMWFjMTE0YzdiNjdhYyIsImlhdCI6MTYxNzA5MDE5MiwiZXhwIjoxNjI0ODY2MTkyfQ.2R5ZungGQ2NN3bAuTwAjMhn-Yuv9Gt59ijvMQ5xzB3w';

class Chat {
  static Future<Map<String, dynamic>> newOne(Map<String, dynamic> data) async {
    try {
      // get response from api
      final res =
          await Repository.postRequest('$url/chat/', data, token: token);

      //check to see are we have any errors is the sent response
      if (res.data['status'] == 'failure') {
        throw ('${res.data['message']}');
      }
      // if we don't have any error we sent back response's data to client
      else {
        return res.data as Map<String, dynamic>;
      }
    } catch (e) {
      print('##### chat.dart newChat() ##### \n');
      throw (e);
    }
  }

  static Future<Map<String, dynamic>> getChats() async {
    try {
      // get response from api
      final res = await Repository.getRequest(url: '$url/chat/', token: token);

      //check to see are we have any errors is the sent response
      if (res.data['status'] == 'failure') {
        throw ('${res.data['message']}');
      }
      // if we don't have any error we sent back response's data to client
      else {
        return res.data as Map<String, dynamic>;
      }
    } catch (e) {
      print('##### chat.dart getChats() ##### \n');
      throw (e);
    }
  }

  static Future<Map<String, dynamic>> getChat({required String chatId}) async {
    try {
      // get response from api
      final res = await Repository.getRequest(
        url: '$url/chat/$chatId',
        token: token,
      );

      //check to see are we have any errors is the sent response
      if (res.data['status'] == 'failure') {
        throw ('${res.data['message']}');
      }
      // if we don't have any error we sent back response's data to client
      else {
        return res.data as Map<String, dynamic>;
      }
    } catch (e) {
      print('##### chat.dart getChats() ##### \n');
      throw (e);
    }
  }

  static Future<Map<String, dynamic>> sendMessage({
    required String chatId,
    required String content,
  }) async {
    try {
      //posting message to api
      final res = await Repository.postRequest(
        '$url/chat/message',
        {
          "content": content,
          "chatId": chatId,
        },
        token: token,
      );

      //check to see are we have any errors is the sent response
      if (res.data['status'] == 'failure') {
        throw ('${res.data['message']}');
      }
      // if we don't have any error we sent back response's data to client
      else {
        return res.data as Map<String, dynamic>;
      }
    } catch (e) {
      print('##### chat.dart getChats() ##### \n');
      throw (e);
    }
  }
}
