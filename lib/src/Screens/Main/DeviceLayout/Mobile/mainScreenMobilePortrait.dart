//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../../../Widgets/responsive_builder.dart';
import '../../../../Widgets/MainScreen/Mobile/Portrait/Btn/mobilePortraitBTN.dart';
import '../../../../Widgets/MainScreen/Mobile/Portrait/Body/mobilePortraitBody.dart';

//importing themes
import '../../../../Themes/color.dart';

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
                MobilePortraitBody(),
                MobilePortraitBTN(width: width),
              ],
            ),
          ),
        );
      },
    );
  }
}
