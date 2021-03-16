//importing packages
import 'package:flutter/material.dart';

//importing utils
import '../utils/convertStringtoColor.dart';

class Tour {
  final String title;
  final String description;
  final String game;
  final String gameMode;
  final String tourMode;
  final String region;
  final String bgImg;

  final Color gradientBegin;
  final Color gradientEnd;
  final Color textColor;
  final Color shadowColor;
  final Color gameIconColorShadowColor;
  final Color bgPriceColor;

  final int prize;
  final List<dynamic> prizePool;

  final int totalRounds;
  final int? enteredPlayers;
  final int? totalPlayers;

  final bool premium;

  Tour.fromJson(Map<String, dynamic> data)
      : title = data['title'],
        description = data['description'],
        game = data['game'],
        gameMode = data['gameMode'],
        tourMode = data['tourMode'],
        region = data['region'],
        bgImg = data['bgImg'],
        gradientBegin = (data['gradientBegin'] as String).convertToColor!,
        gradientEnd = (data['gradientEnd'] as String).convertToColor!,
        textColor = (data['textColor'] as String).convertToColor!,
        shadowColor = (data['shadowColor'] as String).convertToColor!,
        gameIconColorShadowColor =
            (data['gameIconColorShadowColor'] as String).convertToColor!,
        bgPriceColor = (data['bgPriceColor'] as String).convertToColor!,
        prize = data['prize'],
        prizePool = data['prizePool'].map((prize) {
          return int.parse(prize.toString());
        }).toList(),
        totalRounds = data['totalRounds'],
        enteredPlayers = data['enteredPlayers'] ?? 1,
        totalPlayers = data['totalPlayers'] ??
            (data['gameMode'] == 'battle royal' ? 100 : 16),
        premium = data['premium'];

  @override
  String toString() {
    print(
        'title: ${this.title}, prize: ${this.prize}\nprizePool : ${this.prizePool}');
    return super.toString();
  }
}
