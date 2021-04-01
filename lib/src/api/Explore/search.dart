//importing classes
import '../repository.dart';

const String url = 'http://localhost:3000/api/v1/users/find';

//users/find/searchFor=user&term=fortnite
class SearchRepository {
  static Future<Map<String, dynamic>> search({
    required String searchFor,
    required String term,
    required String token,
  }) async {
    try {
      final res = await Repository.getRequest(
        url: url,
        token: token,
        queries: {
          "searchFor": searchFor,
          "term": term,
        },
      );

      if (res.data['status'] == 'failure') {
        throw ('${res.data['message']}');
      } else {
        return res.data as Map<String, dynamic>;
      }
    } catch (err) {
      print('##### getTours.dart fetchTours() ##### \n');
      throw (err);
    }
  }
}
