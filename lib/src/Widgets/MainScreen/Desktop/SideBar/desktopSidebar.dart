//importing packages
import 'package:flutter/material.dart';

//importing themes
import '../../../../Themes/color.dart';

//importing widgets
import './desktopSidebarItem.dart';

class DesktopSideBar extends StatelessWidget {
  DesktopSideBar({required this.height});

  final double height;

  final double padVertical = 20;
  final double padHorizontal = 25;

  final BorderRadius borderRadius = BorderRadius.all(Radius.circular(10));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(left: 50, top: 50, bottom: 50, right: 25),
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
          DesktopSidebarItem(
            title: 'Profile',
            iconUrl: 'assets/btnIcons/profile.svg',
            color: Color(0xFF33019F),
            index: 4,
          ),
          DesktopSidebarItem(
            title: 'Explore',
            iconUrl: 'assets/btnIcons/explore.svg',
            color: Color(0xFF00D1FF),
            index: 3,
          ),
          DesktopSidebarItem(
            title: 'Home',
            iconUrl: 'assets/btnIcons/home.svg',
            color: Color(0xFFFF4D00),
            index: 2,
          ),
          DesktopSidebarItem(
            title: 'Top',
            iconUrl: 'assets/btnIcons/top.svg',
            color: Color(0xFFFF11A0),
            index: 1,
          ),
          DesktopSidebarItem(
            title: 'Shop',
            iconUrl: 'assets/btnIcons/shop.svg',
            color: Color(0xFF9E00FF),
            index: 0,
          ),
          SizedBox(height: 30),
          DesktopSidebarItem(
            title: 'Setting',
            iconUrl: 'assets/btnIcons/setting.svg',
            color: Color(0xE2D433D3),
            index: 5,
          ),
        ],
      ),
    );
  }
}
