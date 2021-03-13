//importing packages
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

//importing utils
import '../../../src/utils/validators.dart';

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

  //setters
  void setlEmail(String lEmail) {
    _lEmail = lEmail;
    notifyListeners();
  }

  void setlPassword(String lPassword) {
    _lPassword = lPassword;
    notifyListeners();
  }

  //Register
  //  options: Options(
  //         headers: {
  //           "Authorization":
  //               "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwM2Q0ZmI4Nzg0NjAzMjU2NGQ0OWNkOSIsImlhdCI6MTYxNDYzMTMzMCwiZXhwIjoxNjIyNDA3MzMwfQ.zBgH1ZdSXmlpqoBNG9OyZBbRq18mgepYiadzq081XTk",
  //         },
  //       ),

  //Login

  void loginUser() async {
    try {
      print(_lEmail);
      print(_lPassword);
      if (_lEmail.isEmpty || (_lEmail.validateEmail == false))
        throw Exception('Please provider a valid email address');

      if (_lPassword.isEmpty || (_lPassword.validatePassword == false))
        throw Exception('Please provider a valid password');

      var response = await Dio().post(
        'http://localhost:3000/auth/login',
        data: {
          'email': _lEmail,
          'password': _lPassword,
        },
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }

  //////////////////////////////////
  /*SignUp State */
  // 's' in the begining stands for 'SignUp'
  //initializing

  bool _isChecked = false;
  bool get isChecked => _isChecked;
  void setIsChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  String _checkedEmailAddress = '';
  String get checkedEmailAddress => _checkedEmailAddress;
  void setCheckedEmailAdress(String value) {
    _checkedEmailAddress = value;
    notifyListeners();
  }

  String _checkedUsername = '';
  String get checkedUsername => _checkedUsername;
  void setCheckedUsername(String value) {
    _checkedUsername = value;
    notifyListeners();
  }

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

  String _sBio = '';
  String get sBio => _sBio;
  void setBio(String bio) {
    _sBio = bio;
    notifyListeners();
  }

  String _sRegion = 'Europe';
  String get sRegion => _sRegion;
  void setRegion(String region) {
    _sRegion = region;
    notifyListeners();
  }

  String _sClanName = '';
  String get sClanName => _sClanName;
  void setSClanName(String sClanName) {
    _sClanName = sClanName;
    notifyListeners();
  }

  List<String> _sPlayingGames = [];
  List<String> get sPlayingGames => _sPlayingGames;
  void setSPlayingGames(String sClanName) {
    final isExist =
        _sPlayingGames.where((game) => game.toString() == sClanName.toString());
    if (isExist.isEmpty) {
      _sPlayingGames.add(sClanName.trim().toLowerCase());
    } else {
      _sPlayingGames.removeWhere((game) => game == sClanName);
    }
    notifyListeners();
  }

  File? _sBgImg;
  File? get sBgImg => _sBgImg;
  Uint8List? _sBgImgU8L;
  Uint8List? get sBgImgU8L => _sBgImgU8L;

  File? _sProfileImg;
  Uint8List? _sProfileImgU8L;
  File? get sProfileImg => _sProfileImg;
  Uint8List? get sProfileImgU8L => _sProfileImgU8L;

  void setImg({required String type, required File file, required unit8File}) {
    if (type == 'profile') {
      _sProfileImg = file;
      _sProfileImgU8L = unit8File;
      notifyListeners();
    } else if (type == 'bg') {
      _sBgImg = file;
      _sBgImgU8L = unit8File;
      print(_sBgImg!.isAbsolute);
      notifyListeners();
    }
  }

  void registerUser() async {
    try {
      if (_lEmail.isEmpty || (_lEmail.validateEmail == false))
        throw Exception('Please provider a valid email address');

      if (_lPassword.isEmpty || (_lPassword.validatePassword == false))
        throw Exception('Please provider a valid password');

      var response = await Dio().post(
        'http://localhost:3000/auth/login',
        data: {
          'email': _lEmail,
          'password': _lPassword,
        },
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
