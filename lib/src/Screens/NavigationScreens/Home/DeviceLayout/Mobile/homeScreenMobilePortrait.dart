//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../../../../Widgets/responsive_builder.dart';
import '../../../../../Widgets/Pages/Home/Mobile/Portrait/homePortraitBody.dart';

//impoting themes
import '../../../../../Themes/color.dart';

class HomeScreenMobilePortrait extends StatelessWidget {
  const HomeScreenMobilePortrait();
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        final height = sizeInfo.screenSize.height;
        final width = sizeInfo.screenSize.width;
        return Scaffold(
          body: Container(
            height: height,
            width: width,
            color: bgColor,
            child: Column(
              children: [
                appBar(context: context, width: width),
              ],
            ),
          ),
        );
      },
    );
  }
}
