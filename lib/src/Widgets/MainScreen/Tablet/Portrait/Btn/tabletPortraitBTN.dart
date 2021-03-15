//importing packages
import 'package:flutter/material.dart';

//importing themes
import '../../../../../Themes/color.dart';

//importing widgets
import 'tabletPortraitBTNItem.dart';

class TabletPortraitBTN extends StatelessWidget {
  TabletPortraitBTN({required this.width});

  final double width;
  final double posFromSides = 25;

  final double padVertical = 15;
  final double padHorizontal = 20;

  final BorderRadius borderRadius = BorderRadius.all(Radius.circular(10));

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: posFromSides,
      right: posFromSides,
      bottom: posFromSides,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          vertical: padVertical,
          horizontal: padHorizontal,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 15),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TabletPortraitBtnItem(
              iconUrl: 'assets/btnIcons/shop.svg',
              color: Color(0xFF9E00FF),
              index: 0,
            ),
            TabletPortraitBtnItem(
              iconUrl: 'assets/btnIcons/top.svg',
              color: Color(0xFFFF11A0),
              index: 1,
            ),
            TabletPortraitBtnItem(
              iconUrl: 'assets/btnIcons/home.svg',
              color: Color(0xFFFF4D00),
              index: 2,
            ),
            TabletPortraitBtnItem(
              iconUrl: 'assets/btnIcons/explore.svg',
              color: Color(0xFF00D1FF),
              index: 3,
            ),
            TabletPortraitBtnItem(
              iconUrl: 'assets/btnIcons/profile.svg',
              color: Color(0xFF33019F),
              index: 4,
            ),
          ],
        ),
      ),
    );
  }
}
