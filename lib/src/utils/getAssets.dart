import 'package:flutter/material.dart';

const List<String> assets = <String>[
  'assets/btnIcons/shop.svg',
  'assets/btnIcons/top.svg',
  'assets/btnIcons/home.svg',
  'assets/btnIcons/explore.svg',
  'assets/btnIcons/profile.svg',
];

const List<String> circles = const [
  'assets/authBackground/circle.png',
  'assets/authBackground/circle_blured.png',
  'assets/authBackground/circle_crancked.png',
  'assets/authBackground/circle_crancked_blured.png',
];

const List<String> squares = const [
  'assets/authBackground/rec.png',
  'assets/authBackground/rec_blured.png',
  'assets/authBackground/rec_crancked.png',
  'assets/authBackground/rec_crancked_blured.png',
];

const List<String> triangles = const [
  'assets/authBackground/triangle.png',
  'assets/authBackground/triangle_blured.png',
  'assets/authBackground/triangle_crancked.png',
  'assets/authBackground/triangle_crancked_blured.png',
];

const List<String> pluses = const [
  'assets/authBackground/plus.png',
  'assets/authBackground/plus_blured.png',
  'assets/authBackground/plus_crancked.png',
  'assets/authBackground/plus_crancked_blured.png',
];

// ProfileScreen

final List<String> listGamesPlayed = [
  'assets/game_icons/fortnite/fortniteTitlePng.png',
  'assets/game_icons/valorant/valorantTitlePng.png',
  'assets/game_icons/rainbowsix/rainbowsixLogoWithTitlePng.png',
  'assets/game_icons/apex/apexTitlePng.png',
];

//  ExploreScreen
List<Map<String, dynamic>> regionServers = [
  <String, dynamic>{
    'name': 'Middle-East',
    'key': 'ME',
    'color': Color(0xFF0057FF),
    'isSelected': true,
  },
  <String, dynamic>{
    'name': 'Europe',
    'key': 'EU',
    'color': Color(0xFFCE0000),
    'isSelected': false,
  },
  <String, dynamic>{
    'name': 'Na-East',
    'key': 'NA-EAST',
    'color': Color(0xFF00D749),
    'isSelected': false,
  },
  <String, dynamic>{
    'name': 'Na-West',
    'key': 'NA-WEST',
    'color': Color(0xFF60B5FF),
    'isSelected': false,
  },
  <String, dynamic>{
    'name': 'Asia',
    'key': 'AS',
    'color': Color(0xFFFF7A00),
    'isSelected': false,
  },
  <String, dynamic>{
    'name': 'Africa',
    'key': 'AF',
    'color': Colors.pink,
    'isSelected': false,
  },
  <String, dynamic>{
    'name': 'Oceania',
    'key': 'OC',
    'color': Colors.redAccent,
    'isSelected': false,
  },
];
List<Map<String, dynamic>> availableGames = [
  <String, dynamic>{
    'name': 'fortnite',
    'image-url': 'assets/game_icons/fortnite/fortniteLogoPng.png',
    'isSelected': true,
    'color-begin': const Color(0xFF8CD9FC),
    'color-end': const Color(0xFF0581B9),
    'shadow': const Color(0xFF55B5E0),
  },
  <String, dynamic>{
    'name': 'valorant',
    'image-url': 'assets/game_icons/valorant/valorantLogoPng.png',
    'isSelected': false,
    'color-begin': const Color(0xFFFEA1A9),
    'color-end': const Color(0xFFDC3B48),
    'shadow': const Color(0xFFF17A84),
  },
  <String, dynamic>{
    'name': 'apex',
    'image-url': 'assets/game_icons/apex/apexPng.png',
    'isSelected': false,
    'color-begin': const Color(0xFFFF7979),
    'color-end': const Color(0xFF810000),
    'shadow': const Color(0xFFC84444),
  },
  <String, dynamic>{
    'name': 'rainbow',
    'image-url': 'assets/game_icons/rainbowsix/rainbowsixLogoPng.png',
    'isSelected': false,
    'color-begin': const Color(0xFFAAAAAA),
    'color-end': const Color(0xFF272727),
    'shadow': const Color(0xFF5B5B5B),
  },
];
