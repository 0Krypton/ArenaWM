//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../../../Widgets/responsive_builder.dart';
import '../../../../Widgets/MainScreen/Tablet/Landscape/SideBar/tabletLandscapeSidebar.dart';
import '../../../../Widgets/MainScreen/Tablet/Landscape/Body/tabletLandscapeBody.dart';

//importing themes
import '../../../../Themes/color.dart';

class MainScreenTabletLandscape extends StatelessWidget {
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
                TabletLandscapeSidebar(height: height),
                TabletLandscapeBody(),
              ],
            ),
          ),
        );
      },
    );
  }
}
