//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing screens
/** Mobile */
import './DeviceLayout/Mobile/Portrait/authScreenMobilePortrait.dart';
import './DeviceLayout/Mobile/Landscape/authScreenMobileLandscape.dart';

/** Tablet */
import './DeviceLayout/Tablet/Landscape/authScreenTabletLandscape.dart';
import './DeviceLayout/Tablet/Portrait/authScreenTabletPortrait.dart';

/** Desktop */
import 'DeviceLayout/Desktop/authScreensDesktop.dart';

import '../../Widgets/orientationLayout.dart';
import '../../Widgets/screenTypeLayout.dart';

//importing provider
import '../../providers/Auth/authWidgetsState.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({required this.title});

  final String title;

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (widget.title == 'REGISTER') {
        context.read(authWidgetsState).setRegister();
      } else if (widget.title == 'LOGIN') {
        context.read(authWidgetsState).setLogin();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: AuthScreenMobilePortrait(),
        landscape: AuthScreenMobileLandscape(),
      ),
      tablet: OrientationLayout(
        portrait: AuthScreenTabletPortrait(),
        landscape: AuthScreenTabletLandscape(),
      ),
      desktop: AuthScreenDesktop(),
    );
  }
}
