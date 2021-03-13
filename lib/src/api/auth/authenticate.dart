//importing class
import '../repository.dart';

const String url = 'http://localhost:3000/api/v1';

class Authenticate {
  static Future<Map<String, dynamic>> check(Map<String, dynamic> data) async {
    try {
      // get response from api
      final res = await Repository.postRequest('$url/users/check', data);

      //check to see are we have any errors is the sent response
      if (res.data['status'] == 'failure') {
        throw ('${res.data['message']}');
      }
      // if we don't have any error we sent back response's data to client
      else {
        return res.data as Map<String, dynamic>;
      }
    } catch (e) {
      print('##### authenticate.dart check() ##### \n');
      throw (e);
    }
  }

  // static Future<Map<String, dynamic>> register(
  //     Map<String, dynamic> data) async {
  //   try {} catch (e) {
  //     print('##### authenticate.dart register() ##### \n');
  //     throw (e);
  //   }
  // }
}
