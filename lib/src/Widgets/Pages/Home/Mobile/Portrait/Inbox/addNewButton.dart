//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing widgets
import '../../../../../animatedScale.dart';

Widget addButton({
  required BuildContext context,
  required AnimationController animationController,
  required String iconUrl,
  required VoidCallback callBack,
}) {
  return AnimatedScale(
    animController: animationController,
    beginScale: 0.0,
    middleOneScale: 1.3,
    middleTwoScale: 0.7,
    endScale: 1.0,
    child: GestureDetector(
      onTap: callBack,
      child: Container(
        height: 50,
        width: 50,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [
              const Color(0xFFA3E4FF),
              const Color(0xFF3BB1E0),
            ],
          ),
          boxShadow: [
            const BoxShadow(
              color: const Color(0xFF75CDF1),
              blurRadius: 30,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            iconUrl,
          ),
        ),
      ),
    ),
  );
}
