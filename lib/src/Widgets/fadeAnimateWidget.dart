//importing packages
import 'package:flutter/material.dart';

class FadeAnimateWidget extends StatefulWidget {
  const FadeAnimateWidget({
    required this.builder,
    this.duration = const Duration(milliseconds: 350),
  });

  // the duration of the animation which we want to play
  final Duration duration;

  // the returning builder which will contain controller and context
  final Function(
    BuildContext context,
    Animation<double> animController,
  ) builder;

  @override
  _FadeAnimateWidgetState createState() => _FadeAnimateWidgetState();
}

class _FadeAnimateWidgetState extends State<FadeAnimateWidget>
    with SingleTickerProviderStateMixin {
  //Controllers
  late final AnimationController _fadeThroughController;

  //Animations
  late final Animation<double> _fadeThroughAnimation;

  @override
  void initState() {
    super.initState();

    //declaring the controller of fadeAnimation
    _fadeThroughController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // the animtion which we will give that to fadeTransition
    _fadeThroughAnimation = Tween<double>(begin: 0, end: 1.0).animate(
      _fadeThroughController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _fadeThroughController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fadeThroughController.reset();
    _fadeThroughController.forward();
    return widget.builder(context, _fadeThroughAnimation);
  }
}
