//importing packages
import 'package:flutter/material.dart';

class SABContainer extends StatelessWidget {
  const SABContainer({
    this.child,
    this.height,
    this.margin = 0.0,
    this.padding = const EdgeInsets.all(0.0),
    this.halfMarginFromWhere,
    this.borderRadius = 0.0,
    this.blurRadius = 0.0,
    this.bgColor = Colors.white,
    this.shadowColor = Colors.grey,
  });

  final Widget child;

  final String halfMarginFromWhere;

  final double height, margin, borderRadius, blurRadius;

  final EdgeInsets padding;

  final Color bgColor, shadowColor;

  @override
  Widget build(BuildContext context) {
    double marginLeft =
        halfMarginFromWhere.toLowerCase() == 'left' ? (margin / 2) : margin;
    double marginRight =
        halfMarginFromWhere.toLowerCase() == 'right' ? (margin / 2) : margin;

    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
      child: Container(
        margin: EdgeInsets.only(
          left: marginLeft,
          right: marginRight,
          bottom: margin,
          top: margin,
        ),
        padding: padding,
        height: height,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadius,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: blurRadius,
            ),
          ],
        ),
        child: child ?? SizedBox(),
      ),
    );
  }
}
