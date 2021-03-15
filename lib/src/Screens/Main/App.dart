//importing packages
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing screens
/** Mobile */
import './DeviceLayout/Mobile/mainScreenMobilePortrait.dart';
import './DeviceLayout/Mobile/mainScreenMobileLandscape.dart';

/** Tablet */
import './DeviceLayout/Tablet/mainScreenTabletLandscape.dart';
import './DeviceLayout/Tablet/mainScreenTabletPortrait.dart';

/** Desktop */
import './DeviceLayout/Desktop/mainScreenDesktop.dart';

//importing widgets
import '../../Widgets/orientationLayout.dart';
import '../../Widgets/screenTypeLayout.dart';

//importing providers
import '../../providers/User/userState.dart';

//importing themes
import '../../Themes/color.dart';

class App extends StatefulWidget {
  const App();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Widget app = ScreenTypeLayout(
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

  final Widget _loadingWidget = Scaffold(
    backgroundColor: bgColor,
    body: Container(
      child: Center(
        child: Container(
          height: 120,
          width: 120,
          child: FlareActor(
            'assets/rive/loading-Complicit-Simple.flr',
            animation: 'Complicit',
          ),
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final user = watch(userState);
        final currentUser = watch(userLoggedIn.state);

        if (currentUser.isNull == true) {
          return user.when(
            data: (user) {
              return app;
            },
            loading: () {
              return _loadingWidget;
            },
            error: (_, __) {
              return Scaffold(
                backgroundColor: bgColor,
                body: Container(
                  child: Center(
                    child: Text('oops error occured'),
                  ),
                ),
              );
            },
          );
        } else {
          return app;
        }
      },
    );
  }
}
