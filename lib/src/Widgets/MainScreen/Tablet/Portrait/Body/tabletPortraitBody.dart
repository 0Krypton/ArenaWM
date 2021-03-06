//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../../../responsive_builder.dart';

class TabletPortraitBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return Align(
        alignment: Alignment.center,
        child: Text(
          sizeInfo.toString(),
        ),
      );
    });
  }
}
