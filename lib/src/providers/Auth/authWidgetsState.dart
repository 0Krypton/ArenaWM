//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authWidgetsState = ChangeNotifierProvider(
  (_) => AuthWidgetsStateNotifier(),
);

class AuthWidgetsStateNotifier extends ChangeNotifier {
  double _loginBodyOpacity = 1.0;
  double _registerBodyOpacity = 0.0;

  double _loginTextPos = 0.0;
  double _registerTextPos = 0.0;

  double _widthScr = 0.0;

  double _widthBg = 0.0;
  double _heightBg = 0.0;

  double _widthBody = 0.0;

  double _authBgPosLeft = 0.0;
  double _authBgPostTop = 0.0;
  double _authBodyPos = 0.0;

  double _registerBgPosLeft = 0.0;
  double _registerBgPosTop = 0.0;
  double _registerBodyPos = 0.0;

  bool _isLogin = true;

  String _authBgTitle = 'REGISTER';
  String _authTitle = 'LOGIN';

  /* Getters */
  double get loginBodyOpacity => _loginBodyOpacity;
  double get registerBodyOpacity => _registerBodyOpacity;

  double get loginTextPos => _loginTextPos;
  double get registerTextPos => _registerTextPos;

  double get widthScr => _widthScr;
  double get widthBg => _widthBg;
  double get heightBg => _heightBg;
  double get widthBody => _widthBody;

  double get authBgPosLeft => _authBgPosLeft;
  double get authBgPostTop => _authBgPostTop;
  double get authBodyPos => _authBodyPos;

  double get registerBgPosLeft => _registerBgPosLeft;
  double get registerBgPosTop => _registerBgPosTop;
  double get registerBodyPos => _registerBodyPos;

  bool get isLogin => _isLogin;

  String get authBgTitle => _authBgTitle;
  String get authTitle => _authTitle;

  /* Setters */

  void setAuthBgTitle(String title) {
    _authBgTitle = title;
    notifyListeners();
  }

  void setWidthScr({required double width, required double height}) {
    _widthScr = width;

    _widthBody = width * .3;

    _widthBg = width * .6;
    _heightBg = height * .8;

    _authBgPostTop = (height - heightBg) / 2;

    if (_authTitle == 'LOGIN') {
      _authBgPosLeft = _widthScr * .1;
      _authBodyPos = (_widthBg / 2) + _authBgPosLeft + (_widthBody / 4);
    } else if (_authTitle == 'REGISTER') {
      _authBodyPos = (_widthBg / 2) - _authBgPosLeft - (_widthBody / 4);
      _authBgPosLeft = _widthScr - widthBg - (widthScr * .1);
    }

    _registerBgPosLeft = _widthScr - widthBg - (widthScr * .1);
    _registerBgPosTop = (height - heightBg) / 2;
    _registerBodyPos = (_widthBg / 2) - _registerBgPosLeft - (_widthBody / 4);

    //TESTING
    // print(
    //   'Width Screen: $_widthScr\nwidthBody: $_widthBody\nwidthBg: $_widthBg\nauthBodyPos: $_authBodyPos',
    // );
    notifyListeners();
  }

  void setLoginTextPos(double value) {
    _loginTextPos += value;
    notifyListeners();
  }

  void setRegisterTextPos(double value) {
    _registerTextPos += value;
    notifyListeners();
  }

  void setLoginBodyOpacity(double opacity) {
    _loginBodyOpacity = opacity;
    notifyListeners();
  }

  void setRegisterBodyOpacity(double opacity) {
    _registerBodyOpacity = opacity;
    notifyListeners();
  }

  void setLogin() {
    _authTitle = 'LOGIN';
    _authBgTitle = 'REGISTER';
    _isLogin = true;
    _loginBodyOpacity = 1.0;
    _registerBodyOpacity = 0;
    notifyListeners();
  }

  void setRegister() {
    _authTitle = 'REGISTER';
    _authBgTitle = 'LOGIN';
    _isLogin = false;
    _loginBodyOpacity = 0;
    _registerBodyOpacity = 1.0;
    notifyListeners();
  }

  void toggleView() {
    if (_authBgTitle == 'LOGIN') {
      _authTitle = 'LOGIN';
      _authBgTitle = 'REGISTER';
      _isLogin = true;

      _authBgPosLeft = _widthScr * .1;
      _authBodyPos = (_widthBg / 2) + _authBgPosLeft + (_widthBody / 4);

      _loginBodyOpacity = 1.0;
      _registerBodyOpacity = 0;
      notifyListeners();
    } else if (_authBgTitle == 'REGISTER') {
      _authTitle = 'REGISTER';
      _authBgTitle = 'LOGIN';

      _authBodyPos = (_widthBg / 2) - _authBgPosLeft - (_widthBody / 4);
      _authBgPosLeft = _widthScr - widthBg - (widthScr * .1);

      _isLogin = false;
      _loginBodyOpacity = 0;
      _registerBodyOpacity = 1.0;
      notifyListeners();
    }
  }
}
