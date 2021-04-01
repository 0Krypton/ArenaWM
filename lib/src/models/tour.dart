//importing packages
import 'package:flutter/material.dart';

//importing utils
import '../utils/convertStringtoColor.dart';

class Tour {
  String? title;
  String? description;
  String? game;
  String? gameMode;
  String? tourMode;
  String? region;
  String? bgImg;

  Color? gradientBegin;
  Color? gradientMid;
  Color? gradientEnd;
  Color? textColor;
  Color? shadowColor;
  Color? gameIconShadowColor;
  Color? bgPriceColor;

  int? prize;
  List<dynamic>? prizePool;

  int? totalRounds;
  int? enteredPlayers;

  int? totalPlayers;

  bool? premium;

  Tour({
    this.title,
    this.description,
    this.game,
    this.gameMode,
    this.tourMode,
    this.region,
    this.bgImg,
    this.gradientBegin,
    this.gradientMid,
    this.gradientEnd,
    this.textColor,
    this.shadowColor,
    this.gameIconShadowColor,
    this.bgPriceColor,
    this.prize,
    this.prizePool,
    this.totalRounds,
    this.enteredPlayers,
    this.totalPlayers,
    this.premium,
  });

  factory Tour.fromJson(Map<String, dynamic> json) {
    Tour tour = Tour(
      title: json['title'] as String,
      description: json['description'] as String,
      game: json['game'] as String,
      gameMode: json['gameMode'] as String,
      tourMode: json['tourMode'] as String,
      region: json['region'] as String,
      bgImg: json['bgImg'] as String,
      gradientBegin: (json['gradientBegin'] as String).convertToColor!,
      gradientEnd: (json['gradientEnd'] as String).convertToColor!,
      textColor: (json['textColor'] as String).convertToColor!,
      shadowColor: (json['shadowColor'] as String).convertToColor!,
      gameIconShadowColor:
          (json['gameIconShadowColor'] as String).convertToColor!,
      bgPriceColor: (json['bgPriceColor'] as String).convertToColor!,
      prize: json['prize'],
      prizePool: json['prizePool'] as List<dynamic>,
      totalRounds: json['totalRounds'],
      enteredPlayers: json['enteredPlayers'],
      totalPlayers: json['totalPlayers'],
      premium: json['premium'],
    );

    Color gradientMid;
    if (json['gradientMid'] != null) {
      gradientMid = (json['gradientMid'] as String).convertToColor!;
      tour.gradientMid = gradientMid;
    }
    return tour;
  }
}
