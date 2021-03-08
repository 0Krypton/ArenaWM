//importing packages
import 'package:flutter/material.dart';

class PositionedImg extends StatelessWidget {
  final String imgUrl;

  final double height, width, bottom, top, left, right, angle;

  final bool hasRight, hasLeft, hasBottom, hasTop;

  const PositionedImg({
    Key key,
    @required this.imgUrl,
    @required this.height,
    @required this.width,
    this.hasRight = false,
    this.hasLeft = false,
    this.hasBottom = false,
    this.hasTop = false,
    this.angle = 0,
    this.bottom = 0,
    this.top = 0,
    this.left = 0,
    this.right = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hasRight && hasBottom) {
      return Positioned(
        bottom: bottom,
        right: right,
        child: Transform.rotate(
          angle: angle,
          child: Image.asset(
            imgUrl,
            height: height,
            width: width,
            fit: BoxFit.contain,
          ),
        ),
      );
    } else if (hasRight && hasTop) {
      return Positioned(
        top: top,
        right: right,
        child: Transform.rotate(
          angle: angle,
          child: Image.asset(
            imgUrl,
            height: height,
            width: width,
            fit: BoxFit.contain,
          ),
        ),
      );
    } else if (hasLeft && hasBottom) {
      return Positioned(
        bottom: bottom,
        left: left,
        child: Transform.rotate(
          angle: angle,
          child: Image.asset(
            imgUrl,
            height: height,
            width: width,
            fit: BoxFit.contain,
          ),
        ),
      );
    } else if (hasLeft && hasTop) {
      return Positioned(
        top: top,
        left: left,
        child: Transform.rotate(
          angle: angle,
          child: Image.asset(
            imgUrl,
            height: height,
            width: width,
            fit: BoxFit.contain,
          ),
        ),
      );
    } else if (hasLeft) {
      return Positioned(
        left: left,
        child: Transform.rotate(
          angle: angle,
          child: Image.asset(
            imgUrl,
            height: height,
            width: width,
            fit: BoxFit.contain,
          ),
        ),
      );
    } else if (hasRight) {
      return Positioned(
        right: right,
        child: Transform.rotate(
          angle: angle,
          child: Image.asset(
            imgUrl,
            height: height,
            width: width,
            fit: BoxFit.contain,
          ),
        ),
      );
    } else if (hasBottom) {
      return Positioned(
        bottom: bottom,
        child: Transform.rotate(
          angle: angle,
          child: Image.asset(
            imgUrl,
            height: height,
            width: width,
            fit: BoxFit.contain,
          ),
        ),
      );
    }
    return Positioned(
      top: top,
      child: Transform.rotate(
        angle: angle,
        child: Image.asset(
          imgUrl,
          height: height,
          width: width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
