//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../../../../Widgets/responsive_builder.dart';
import '../../../../../Widgets/Pages/Profile/Mobile/Portrait/profilePortraitBody.dart';

//impoting themes
import '../../../../../Themes/color.dart';

class ProfileScreenMobilePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        final height = sizeInfo.screenSize.height;
        final width = sizeInfo.screenSize.width;
        return Container(
          height: height,
          width: width,
          color: colors[4],
        );
      },
    );
  }
}
