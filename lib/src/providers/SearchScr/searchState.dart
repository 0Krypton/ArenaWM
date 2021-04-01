//importing packages
import 'package:app_v2/src/models/tour.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing repositories
import '../../api/Explore/search.dart';

//importing models
import '../../models/user.dart';

final searchState = ChangeNotifierProvider((ref) => SearchState());

class SearchState extends ChangeNotifier {
  //if this value is true, then show the loading animation in SearchScreenResultPage
  bool _isSearching = true;
  bool get isSearching => _isSearching;
  void setIsSearching() {
    _isSearching = false;
    notifyListeners();
  }

  // setting the searchOptions
  String _searchingFor = 'user';
  String get searchingFor => _searchingFor;
  void setSearchFor(String searchingFor) {
    _searchingFor = searchingFor;
    notifyListeners();
  }

  String _term = '';
  String get term => _term;
  void setTerm(String term) {
    _term = term;
    notifyListeners();
  }
}

final searchRes = FutureProvider<List<dynamic>>(
  (ref) async {
    // initializing searchState
    final SearchState sState = ref.watch(searchState);

    // looking for searchingFor and term from another provider
    final String searchingFor = sState.searchingFor;
    final String term = sState.term;

    //Getting search response from api
    final Map<String, dynamic> res = await SearchRepository.search(
      searchFor: searchingFor,
      term: term,
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwNjJkNjhmNGNlMWFjMTE0YzdiNjdhYyIsImlhdCI6MTYxNzA5MDE5MiwiZXhwIjoxNjI0ODY2MTkyfQ.2R5ZungGQ2NN3bAuTwAjMhn-Yuv9Gt59ijvMQ5xzB3w',
    );

    if (searchingFor == 'user') {
      //converting json to UserModels
      final List<UserModel> users = (res['data'] as List<dynamic>).map((user) {
        return UserModel.fromJson(user);
      }).toList();

      return users;
    } else if (searchingFor == 'tour') {
      //converting json to TourModels
      final List<Tour> tours = (res['data'] as List<dynamic>)
          .map((tour) => Tour.fromJson(tour))
          .toList();

      return tours;
    } else {
      return [];
    }
  },
);
