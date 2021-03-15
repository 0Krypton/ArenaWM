//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sideBarState =
    ChangeNotifierProvider.autoDispose((ref) => SideBarState());

class SideBarState extends ChangeNotifier {
  late AnimationController _sideBarAnimationController;
  AnimationController get sideBarAnimController => _sideBarAnimationController;

  void setController(AnimationController controller) {
    _sideBarAnimationController = controller;
    notifyListeners();
  }

  void playAnimation() {
    if (_sideBarAnimationController.isCompleted) {
      _sideBarAnimationController.reverse();
      notifyListeners();
    } else {
      _sideBarAnimationController.forward();
      notifyListeners();
    }
  }

  double _animationValue = 0.0;
  double get animationValue => _animationValue;

  void setAnimationValue(double value) {
    _animationValue = value;
    notifyListeners();
  }
}
