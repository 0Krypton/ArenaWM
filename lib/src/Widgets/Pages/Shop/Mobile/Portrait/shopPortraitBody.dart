//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../../../responsive_builder.dart';

class MobilePortraitShopBody extends StatelessWidget {
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
              Text('Shop'),
              Text(sizeInfo.toString()),
            ],
          ),
        );
      },
    );
  }
}
