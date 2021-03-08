//importing packages
import 'package:flutter/material.dart';

//importing enum types
import '../enums/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData media) {
  double deviceWidth = media.size.width;

  Orientation orientation = media.orientation;

  // if orientation is equal to Orientation.portrait we don't returen
  // DeviceScreenType.Desktop because only in landscape mode we have
  // DeviceScreenType.Desktop

  if (orientation == Orientation.portrait) {
    if (deviceWidth > 650) {
      return DeviceScreenType.Tablet;
    }
    return DeviceScreenType.Mobile;
  } else {
    if (deviceWidth > 1024) {
      return DeviceScreenType.Desktop;
    }
    if (deviceWidth > 650) {
      return DeviceScreenType.Tablet;
    }

    return DeviceScreenType.Mobile;
  }
}
