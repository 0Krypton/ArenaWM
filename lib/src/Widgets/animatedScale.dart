//importing packages
import 'package:flutter/material.dart';

class AnimatedScale extends StatelessWidget {
  AnimatedScale({
    required this.beginScale,
    required this.endScale,
    required this.middleOneScale,
    required this.middleTwoScale,
    this.animController,
    this.animation,
    required this.child,
  });

  final double beginScale, middleOneScale, middleTwoScale, endScale;
  final AnimationController? animController;
  final Animation<double>? animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: beginScale, end: middleOneScale),
            weight: 40.0,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: middleOneScale, end: middleTwoScale),
            weight: 20.0,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: middleTwoScale, end: endScale),
            weight: 40.0,
          ),
        ],
      ).animate(animController == null ? animation! : animController!),
      child: child,
    );
  }
}
