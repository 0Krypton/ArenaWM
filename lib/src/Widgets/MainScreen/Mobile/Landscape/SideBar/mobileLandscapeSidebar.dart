//importing packages
import 'package:flutter/material.dart';

//importing themes
import '../../../../../Themes/color.dart';

//importing widgets
import 'mobileLandscapeSidebarItem.dart';

class MobileLandscapeBTN extends StatelessWidget {
  MobileLandscapeBTN({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  final double padVertical = 20;
  final double padHorizontal = 10;

  final BorderRadius borderRadius = BorderRadius.all(Radius.circular(10));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 10),
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MobileLandscapeBtnItem(
            title: 'Profile',
            iconUrl: 'assets/btnIcons/profile.svg',
            color: Color(0xFF33019F),
            index: 5,
          ),
          MobileLandscapeBtnItem(
            title: 'Explore',
            iconUrl: 'assets/btnIcons/explore.svg',
            color: Color(0xFF00D1FF),
            index: 4,
          ),
          MobileLandscapeBtnItem(
            title: 'Home',
            iconUrl: 'assets/btnIcons/home.svg',
            color: Color(0xFFFF4D00),
            index: 3,
          ),
          MobileLandscapeBtnItem(
            title: 'Top',
            iconUrl: 'assets/btnIcons/top.svg',
            color: Color(0xFFFF11A0),
            index: 2,
          ),
          MobileLandscapeBtnItem(
            title: 'Shop',
            iconUrl: 'assets/btnIcons/shop.svg',
            color: Color(0xFF9E00FF),
            index: 1,
          ),
        ],
      ),
    );
  }
}
