//importing packages
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onTapCallBack,
    required this.title,
    required this.fontFamily,
    required this.borderRadius,
    required this.blurRadius,
    required this.bgColor,
    required this.shadowColor,
    required this.textColor,
  });

  final Function onTapCallBack;

  final String title, fontFamily;

  final double borderRadius, blurRadius;

  final Color bgColor, shadowColor, textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapCallBack();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          boxShadow: [BoxShadow(color: shadowColor, blurRadius: blurRadius)],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontFamily: fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
