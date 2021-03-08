//importing packages
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  void loginUser() {
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

  File _sBgImg;
  File _sProfileImg;
}
