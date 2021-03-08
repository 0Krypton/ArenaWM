//importing packages
import 'package:flutter/material.dart';

//importing local files
import '../sizing_information.dart';

//importing utils
import '../utils/getDeviceType.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
  ) builder;

  const ResponsiveBuilder({required this.builder});

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    return LayoutBuilder(builder: (contextn, constraints) {
      SizingInformation sizingInformation = SizingInformation(
        orientation: media.orientation,
        deviceType: getDeviceType(media),
        screenSize: media.size,
        localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight),
      );

      return builder(context, sizingInformation);
    });
  }
}
