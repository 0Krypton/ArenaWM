//importing packages
import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {
  final Widget portrait;
  final Widget landscape;

  const OrientationLayout({
    Key key,
    @required this.portrait,
    @required this.landscape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return orientation == Orientation.landscape ? landscape : portrait;
  }
}
