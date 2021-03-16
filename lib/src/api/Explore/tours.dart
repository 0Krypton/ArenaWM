//importing classes
import '../repository.dart';

const String url = 'http://localhost:3000/api/v1/tours/tourByFilter';

//tours/tourByFilter?region=me&game=fortnite
class TourRepository {
  static Future<Map<String, dynamic>> fetchTours(
      {required String game,
      required String region,
      required String token}) async {
    try {
      final res = await Repository.getRequest(
        url: url,
        token: token,
        queries: {
          "game": game,
          "region": region,
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
