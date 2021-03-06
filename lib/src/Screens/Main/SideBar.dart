//importing packages
import 'package:flutter/material.dart';

//importing Widgets
import '../../Widgets/sideBarAndBodyContainer.dart';

//importing local files
import '../../sizing_information.dart';

class SideBar extends StatelessWidget {
  final double margin, height;
  final SizingInformation sizingInformation;

  SideBar({
    this.margin,
    this.height,
    this.sizingInformation,
  });

  @override
  Widget build(BuildContext context) {
    return SABContainer(
      height: height,
      margin: margin,
      padding: EdgeInsets.all(10),
      halfMarginFromWhere: 'right',
      borderRadius: 15,
      blurRadius: 50,
      bgColor: Colors.white,
      shadowColor: Colors.black.withAlpha(20),
      child: Text(
        sizingInformation.toString(),
      ),
    );
  }

  // Widget _buildSideBarItems() {
  //   return Column();
  // }
}
