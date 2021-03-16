//importing packaegs
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing utils
import '../../utils/getAssets.dart';

final exploreScrState = ChangeNotifierProvider(
  (ref) => ExploreScrNotifier(
    token:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwNGY3ZGQyMDhmNzUyMDRiNGFjMGY1MCIsImlhdCI6MTYxNTgyMjI5MSwiZXhwIjoxNjIzNTk4MjkxfQ.CL1nYUpoD_nMIEqx56SRSaXxrgXve8zh2_G699OMkzY',
  ),
);

class ExploreScrNotifier extends ChangeNotifier {
  final String token;
  ExploreScrNotifier({required this.token});

  //OrderBy
  List<String> _orderByRegion = ['ME'];
  List<String> _orderByGame = ['fortnite'];

  //Getters
  List<Map<String, dynamic>> get regions => regionServers;
  List<Map<String, dynamic>> get games => availableGames;

  List<String> get orderByRegion => _orderByRegion;
  List<String> get orderByGame => _orderByGame;

  // Region Order Changing
  void changeRegionOrder(int index) {
    Map<String, dynamic> region = regions[index];
    regions.forEach((reg) {
      reg['isSelected'] = false;
    });
    _orderByRegion = [];

    if (!_orderByRegion.contains(region['key'])) {
      _orderByRegion.add(region['key']);
      region['isSelected'] = !region['isSelected'];
    } else {
      _orderByRegion.removeWhere((regionName) => regionName == region['key']);
    }

    notifyListeners();
  }

  // Games Order Changing
  void changeGameOrder(int index) {
    Map<String, dynamic> game = games[index];
    games.forEach((g) => g['isSelected'] = false);
    _orderByGame = [];

    if (!_orderByGame.contains(game['name'])) {
      _orderByGame.add(game['name']);
      game['isSelected'] = !game['isSelected'];
    } else {
      _orderByGame.removeWhere((gameName) => gameName == game['name']);
    }

    notifyListeners();
  }
}
