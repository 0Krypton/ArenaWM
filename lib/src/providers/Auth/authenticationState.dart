//importing packages
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

//importing dart files
import 'dart:io';

final authentication = ChangeNotifierProvider<AuthenticationState>((ref) {
  return AuthenticationState();
});

class AuthenticationState extends ChangeNotifier {
  //////////////////////////////////
  /*Login State */
  // 'l' in the begining stands for 'Login'
  //initializing
  String _lEmail = '';
  String _lPassword = '';

  //getters
  String get lEmail => _lEmail;
  String get lPassword => _lPassword;

  //voidters
  void setlEmail(String lEmail) {
    _lEmail = lEmail;
    notifyListeners();
  }

  void setlPassword(String lPassword) {
    _lPassword = lPassword;
    notifyListeners();
  }

  void loginUser() async {
    http.Response res =
        await http.get(new Uri(path: 'http://localhost:3000/tour'), headers: {
      "Content-Type": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwM2Q0ZmI4Nzg0NjAzMjU2NGQ0OWNkOSIsImlhdCI6MTYxNDYzMTMzMCwiZXhwIjoxNjIyNDA3MzMwfQ.zBgH1ZdSXmlpqoBNG9OyZBbRq18mgepYiadzq081XTk"
    });
    Map<String, dynamic> data = jsonDecode(res.body);
    print(data);
    print('Email: $_lEmail');
    print('Password: $_lPassword');
    print('LoggedIn');
  }

  //////////////////////////////////
  /*SignUp State */
  // 's' in the begining stands for 'SignUp'
  //initializing
  String _sEmail = '';
  String get sEmail => _sEmail;
  void setSEmail(String sEmail) {
    _sEmail = sEmail;
    notifyListeners();
  }

  String _sPassword = '';
  String get sPassword => _sPassword;
  void setSPassword(String sPassword) {
    _sPassword = sPassword;
    notifyListeners();
  }

  String _sUsername = '';
  String get sUsername => _sUsername;
  void setSUsername(String sUsername) {
    _sUsername = sUsername;
    notifyListeners();
  }

  String _sFName = '';
  String get sFName => _sFName;
  void setSFName(String sFName) {
    _sFName = sFName;
    notifyListeners();
  }

  String _sLName = '';
  String get sLName => _sLName;
  void setSLName(String sLName) {
    _sLName = sLName;
    notifyListeners();
  }

  String _sClanName = '';
  void setSClanName(String sClanName) {
    _sClanName = sClanName;
    notifyListeners();
  }

  List<String> _sPlayingGames = [];
  void setSPlayingGames(String sClanName) {
    String isExist = _sPlayingGames.firstWhere((game) => game == sClanName);
    if (isExist.isEmpty) {
      _sPlayingGames.add(sClanName.trim().toLowerCase());
    } else {
      _sPlayingGames.removeWhere((game) => game == sClanName);
    }
    notifyListeners();
  }

  late File _sBgImg;
  late File _sProfileImg;
}
