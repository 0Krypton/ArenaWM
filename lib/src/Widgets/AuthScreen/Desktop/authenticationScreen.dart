//importing packages
import 'package:app_v2/src/providers/Auth/authWidgetsState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing widgets
import '../../responsive_builder.dart';
import '../../arenaLogo.dart';
import 'Widgets/authBgWidget.dart';
import 'Widgets/authBodyWidget.dart';

//importing themes
import '../../../Themes/color.dart';

class AuthenticationScreenDesktop extends StatefulWidget {
  // The login page is the main page of our authentication process

  @override
  _AuthenticationScreenDesktopState createState() =>
      _AuthenticationScreenDesktopState();
}

class _AuthenticationScreenDesktopState
    extends State<AuthenticationScreenDesktop> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read(authWidgetsState).setWidthScr(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          );
    });
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
                const AuthBg(),
                const AuthBody(),
                const Positioned(left: 25, top: 25, child: const ArenaLogo()),
              ],
            ),
          ),
        );
      },
    );
  }
}
