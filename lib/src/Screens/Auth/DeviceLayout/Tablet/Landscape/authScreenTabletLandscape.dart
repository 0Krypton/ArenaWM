//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../../../../Widgets/responsive_builder.dart';

//importing themes
import '../../../../../Themes/color.dart';

class AuthScreenTabletLandscape extends StatelessWidget {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tablet landscape auth',
                ),
                Text(sizeInfo.toString()),
              ],
            ),
          ),
        );
      },
    );
  }
}
