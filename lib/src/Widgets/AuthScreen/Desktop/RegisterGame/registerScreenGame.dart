//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../../arenaLogo.dart';
import '../../../responsive_builder.dart';
import '../Widgets/registerScreensBgWidget.dart';
import './registerGameBody.dart';

//importing themes
import '../../../../Themes/color.dart';

class RegisterGame extends StatelessWidget {
  // The login page is the main page of our authentication process

  const RegisterGame();

  static const id = 'RegisterGame';

  static Route comeToPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) => RegisterGame(),
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation1, animation2, child) {
        return Opacity(
          opacity: animation1.value,
          child: child,
        );
      },
    );
  }

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
            child: Stack(
              children: [
                const RegisterBg(),
                const RegisterGameBody(),
                const Positioned(left: 25, top: 25, child: const ArenaLogo()),
              ],
            ),
          ),
        );
      },
    );
  }
}
