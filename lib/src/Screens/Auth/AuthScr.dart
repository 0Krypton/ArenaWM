//importing packages
import 'package:flutter/material.dart';

//importing screens
/** Mobile */
import './DeviceLayout/Mobile/Portrait/authScreenMobilePortrait.dart';
import './DeviceLayout/Mobile/Landscape/authScreenMobileLandscape.dart';

/** Tablet */
import './DeviceLayout/Tablet/Landscape/authScreenTabletLandscape.dart';
import './DeviceLayout/Tablet/Portrait/authScreenTabletPortrait.dart';

/** Desktop */
import './DeviceLayout/Desktop/authScreenDesktop.dart';

import '../../Widgets/orientationLayout.dart';
import '../../Widgets/screenTypeLayout.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

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
