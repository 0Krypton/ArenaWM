import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchScreenWidgetState = ChangeNotifierProvider.autoDispose(
  (ref) => SearchScreenWidgetState(),
);

class SearchScreenWidgetState extends ChangeNotifier {
  bool _isCollapsed = true;
  bool get isCollapsed => _isCollapsed;

  void setIsCollapsed(bool value) {
    _isCollapsed = value;

    notifyListeners();
  }

  late AnimationController _scaleAnimController;
  late Animation<double> _scaleAnim;
  AnimationController get scaleAnimController => _scaleAnimController;
  Animation<double> get scaleAnim => _scaleAnim;

  void setScaleAnimController(AnimationController controller) {
    _scaleAnimController = controller;
    _scaleAnim = Tween(begin: 1.0, end: 0.7).animate(
      CurvedAnimation(
        parent: _scaleAnimController,
        curve: Curves.easeInBack,
      ),
    );

    _posFromBottom = -(_scaleAnimController.value * 250);
    notifyListeners();
  }

  double _scale = 0.7;

  double get scale => _scale;
  void setScale(double value) {
    _scale = value;
    notifyListeners();
  }

  void setValues({required double animControllerValue}) {
    _posFromBottom = animControllerValue * -250;
    _scale = 1 - (animControllerValue * .3);

    notifyListeners();
  }

  double _posFromBottom = -250.0;
  double get posFromBottom => _posFromBottom;

  String _activeSearchOption = 'user';
  String get activeSearchOption => _activeSearchOption;
  void setActiveSearchOption({required String option, required int index}) {
    _activeSearchOption = option;
    _activeSearchOptionIndex = index;
    notifyListeners();
  }

  int _activeSearchOptionIndex = 0;
  int get activeSearchOptionIndex => _activeSearchOptionIndex;
}
