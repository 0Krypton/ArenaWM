//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../responsive_builder.dart';

//importing themes
import '../../../Themes/color.dart';

class RegisterClanScreenDesktop extends StatelessWidget {
  // The login page is the main page of our authentication process

  const RegisterClanScreenDesktop();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        final double height = sizeInfo.screenSize.height;
        final double width = sizeInfo.screenSize.width;

        return Scaffold(
          backgroundColor: bgColor,
          body: Container(
            height: height,
            width: width,
            child: Column(
              children: [
                Text('Register Screen Clan'),
                Text(sizeInfo.toString()),
              ],
            ),
          ),
        );
      },
    );
  }
}
