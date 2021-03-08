//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../responsive_builder.dart';

//importing themes
import '../../../Themes/color.dart';

class RegisterPlayingGameScreenDesktop extends StatelessWidget {
  // The login page is the main page of our authentication process

  const RegisterPlayingGameScreenDesktop();

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
                Text('Register Playing games'),
                Text(sizeInfo.toString()),
              ],
            ),
          ),
        );
      },
    );
  }
}
