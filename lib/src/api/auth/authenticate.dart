//importing class
import '../repository.dart';

//importing models
import '../../models/user.dart';

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

  static Future<UserModel> getUser({required String token}) async {
    try {
      // get response from api
      final res =
          await Repository.getRequest(url: '$url/users/getMe', token: token);

      //check to see are we have any errors is the sent response
      if (res.data['status'] == 'failure') {
        throw ('${res.data['message']}');
      }
      // if we don't have any error we sent back response's data to client
      else {
        return UserModel.fromJson(res.data['data']);
      }
    } catch (e) {
      print('##### authenticate.dart getUser() ##### \n');
      throw (e);
    }
  }
}
