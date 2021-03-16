//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sideBarState =
    ChangeNotifierProvider.autoDispose((ref) => SideBarState());

class SideBarState extends ChangeNotifier {
  late AnimationController _sideBarAnimationController;
  AnimationController get sideBarAnimController => _sideBarAnimationController;

  late Animation<Color?> _shadowTweenColor;
  Animation<Color?> get shadowTweenColor => _shadowTweenColor;

  void setController(AnimationController controller) {
    _sideBarAnimationController = controller;
    _shadowTweenColor = ColorTween(
      begin: Color(0xFFFFFFFF),
      end: Color(0xFFE9E9E9),
    ).animate(_sideBarAnimationController)
      ..addListener(() {});
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
