//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../../../Widgets/responsive_builder.dart';
import '../../../../Widgets/MainScreen/Mobile/Landscape/SideBar/mobileLandscapeSidebar.dart';
import '../../../../Widgets/MainScreen/Mobile/Landscape/Body/mobileLandscapeBody.dart';

//importing themes
import '../../../../Themes/color.dart';

class MainScreenMobileLandscape extends StatelessWidget {
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
            child: Row(
              children: [
                MobileLandscapeBTN(height: height),
                MobileLandscapeBody(),
              ],
            ),
          ),
        );
      },
    );
  }
}
