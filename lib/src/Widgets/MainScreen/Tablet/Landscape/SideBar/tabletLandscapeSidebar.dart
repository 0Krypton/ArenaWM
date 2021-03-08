//importing packages
import 'package:flutter/material.dart';

//importing themes
import '../../../../../Themes/color.dart';

//importing widgets
import 'tabletLandscapeSidebarItem.dart';

class TabletLandscapeSidebar extends StatelessWidget {
  TabletLandscapeSidebar({required this.height});

  final double height;

  final double padVertical = 20;
  final double padHorizontal = 25;

  final BorderRadius borderRadius = BorderRadius.all(Radius.circular(10));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(left: 25, top: 25, bottom: 25, right: 10),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TabletLandscapeSidebarItem(
            title: 'Profile',
            iconUrl: 'assets/btnIcons/profile.svg',
            color: Color(0xFF33019F),
            index: 5,
          ),
          TabletLandscapeSidebarItem(
            title: 'Explore',
            iconUrl: 'assets/btnIcons/explore.svg',
            color: Color(0xFF00D1FF),
            index: 4,
          ),
          TabletLandscapeSidebarItem(
            title: 'Home',
            iconUrl: 'assets/btnIcons/home.svg',
            color: Color(0xFFFF4D00),
            index: 3,
          ),
          TabletLandscapeSidebarItem(
            title: 'Top',
            iconUrl: 'assets/btnIcons/top.svg',
            color: Color(0xFFFF11A0),
            index: 2,
          ),
          TabletLandscapeSidebarItem(
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
