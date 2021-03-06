//importing packages
import 'package:flutter/material.dart';

//importing Widgets
import '../Widgets/responsive_builder.dart';

//importing enums
import '../enums/device_screen_type.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenTypeLayout({
    Key key,
    @required this.mobile,
    @required this.desktop,
    this.tablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        // if user on tablet then return Tablet Screen
        if (sizeInfo.deviceType == DeviceScreenType.Tablet) {
          if (tablet != null) {
            return tablet;
          }
        }

        if (sizeInfo.deviceType == DeviceScreenType.Desktop) {
          if (desktop != null) {
            return desktop;
          }
        }

        return mobile;
      },
    );
  }
}
