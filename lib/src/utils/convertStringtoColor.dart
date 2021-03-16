//importing packages
import 'package:flutter/material.dart';

extension ConvertToColor on String {
  Color? get convertToColor {
    final strColor = this.replaceAll("#", "");
    if (strColor.length == 6) {
      return Color(int.parse("0xFF" + strColor));
    } else if (strColor.length == 8) {
      return Color(int.parse("0x" + strColor));
    }
  }
}
