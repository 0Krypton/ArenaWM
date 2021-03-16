//importing packages
import 'package:flutter/material.dart';

//importing themes
import 'package:app_v2/src/Themes/color.dart';

//impoting assets
import './getAssets.dart';

class GameAssist {
  static String getGameImageUrl(String game) {
    if (game == 'fortnite') {
      return listGamesPlayed[0];
    } else if (game == 'valorant') {
      return listGamesPlayed[1];
    } else if (game == 'rainbow') {
      return listGamesPlayed[2];
    } else if (game == 'apex') {
      return listGamesPlayed[3];
    } else {
      return '';
    }
  }

  static List<Color> getGameColor(String game) {
    if (game == 'fortnite') {
      return gameGradientColor[0];
    } else if (game == 'valorant') {
      return gameGradientColor[1];
    } else if (game == 'rainbow') {
      return gameGradientColor[2];
    } else if (game == 'apex') {
      return gameGradientColor[3];
    } else {
      return const [
        const Color(0xFF777777),
        const Color(0xFF777777),
      ];
    }
  }

  static Color getGameShadowColor(String game) {
    if (game == 'fortnite') {
      return gameShadowColors[0];
    } else if (game == 'valorant') {
      return gameShadowColors[1];
    } else if (game == 'rainbow') {
      return gameShadowColors[2];
    } else if (game == 'apex') {
      return gameShadowColors[3];
    } else {
      return Color(0xFF777777);
    }
  }

  static String getGameLogo({required String gameName}) {
    switch (gameName) {
      case 'fortnite':
        return 'assets/game_icons/fortnite/fortniteLogoPng.png';
      case 'valorant':
        return 'assets/game_icons/valorant/valorantLogoPng.png';
      case 'apex':
        return 'assets/game_icons/apex/apexPng.png';
      case 'rainbow':
        return 'assets/game_icons/rainbowsix/rainbowsixLogoPng.png';
      default:
    }
    return '';
  }
}
