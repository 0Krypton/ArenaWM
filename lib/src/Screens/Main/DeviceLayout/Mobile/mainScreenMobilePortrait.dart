//importing packages
import 'package:app_v2/src/providers/btn_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing widgets
import '../../../../Widgets/responsive_builder.dart';
import '../../../../Widgets/MainScreen/Mobile/Portrait/Btn/mobilePortraitBTN.dart';

//importing screens for ---MOBILE PORTRAIT MODE---
import '../../../NavigationScreens/Profile/DeviceLayout/Mobile/profileScreenMobilePortrait.dart';
import '../../../NavigationScreens/Explore/DeviceLayout/Mobile/exploreScreenMobilePortrait.dart';
import '../../../NavigationScreens/Home/DeviceLayout/Mobile/homeScreenMobilePortrait.dart';
import '../../../NavigationScreens/Top/DeviceLayout/Mobile/topScreenMobilePortrait.dart';
import '../../../NavigationScreens/Store/DeviceLayout/Mobile/storeScreenMobilePortrait.dart';

//importing themes
import '../../../../Themes/color.dart';

List<Widget> pages = [
  StoreScreenMobilePortrait(),
  TopScreenMobilePortrait(),
  HomeScreenMobilePortrait(),
  ExploreScreenMobilePortrait(),
  ProfileScreenMobilePortrait(),
];

class MainScreenMobilePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        final height = sizeInfo.screenSize.height;
        final width = sizeInfo.screenSize.width;

        return Scaffold(
          backgroundColor: bgColor,
          body: Container(
            height: height,
            width: width,
            child: Stack(
              children: [
                //Pages
                Consumer(
                  builder: (context, watch, child) {
                    int selectedIndex = watch(btnIndexProvider.state);
                    return pages[selectedIndex];
                  },
                ),
                //Btn
                MobilePortraitBTN(width: width),
              ],
            ),
          ),
        );
      },
    );
  }
}
