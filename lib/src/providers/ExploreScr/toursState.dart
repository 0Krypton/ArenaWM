//importing packages
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing providers
import '../../providers/ExploreScr/exploreScrState.dart';

//importing apis
import '../../api/Explore/tours.dart';

//importing models
import '../../models/tour.dart';

final fetchTours = FutureProvider(
  (ref) async {
    final String game = ref.watch(exploreScrState).orderByGame[0];
    final String region = ref.watch(exploreScrState).orderByRegion[0];

    final Map<String, dynamic> tournouments = await TourRepository.fetchTours(
      game: game,
      region: region,
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwNjJkNjhmNGNlMWFjMTE0YzdiNjdhYyIsImlhdCI6MTYxNzA5MDE5MiwiZXhwIjoxNjI0ODY2MTkyfQ.2R5ZungGQ2NN3bAuTwAjMhn-Yuv9Gt59ijvMQ5xzB3w',
    );
    final List<Tour> models =
        (tournouments['data'] as List<dynamic>).map((tournoument) {
      return Tour.fromJson(tournoument);
    }).toList();

    return models;
  },
);

final tourListState =
    ChangeNotifierProvider.autoDispose((ref) => TourListState());

class TourListState extends ChangeNotifier {
  double _scale = 0.0;
  double get scale => _scale;

  void setScale(newScale) {
    _scale = newScale;
    notifyListeners();
  }
}
