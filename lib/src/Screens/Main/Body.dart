//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../Widgets/sideBarAndBodyContainer.dart';

//importing local files
import '../../sizing_information.dart';

class Body extends StatelessWidget {
  final double margin, height;

  final SizingInformation sizingInformation;

  Body({
    this.margin,
    this.height,
    this.sizingInformation,
  });

  @override
  Widget build(BuildContext context) {
    return SABContainer(
      height: height,
      margin: margin,
      halfMarginFromWhere: 'left',
      borderRadius: 15,
      blurRadius: 50,
      bgColor: Colors.white,
      shadowColor: Colors.black.withAlpha(20),
      child: Text(
        sizingInformation.toString(),
      ),
    );
  }
}
