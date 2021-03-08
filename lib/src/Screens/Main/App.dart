//importing packages
import 'package:flutter/material.dart';

//importing screens
/** Mobile */
import './DeviceLayout/Mobile/mainScreenMobilePortrait.dart';
import './DeviceLayout/Mobile/mainScreenMobileLandscape.dart';

/** Tablet */
import './DeviceLayout/Tablet/mainScreenTabletLandscape.dart';
import './DeviceLayout/Tablet/mainScreenTabletPortrait.dart';

/** Desktop */
import './DeviceLayout/Desktop/mainScreenDesktop.dart';

import '../../Widgets/orientationLayout.dart';
import '../../Widgets/screenTypeLayout.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: MainScreenMobilePortrait(),
        landscape: MainScreenMobileLandscape(),
      ),
      tablet: OrientationLayout(
        portrait: MainScreenTabletPortrait(),
        landscape: MainScreenTabletLandscape(),
      ),
      desktop: MainScreenDesktop(),
    );
  }
}
