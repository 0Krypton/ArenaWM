//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../../../responsive_builder.dart';

class MobilePortraitHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        return Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Home'),
              Text(sizeInfo.toString()),
            ],
          ),
        );
      },
    );
  }
}
