//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing widgets
import '../../../../../Widgets/responsive_builder.dart';
import '../../../../../Widgets/Pages/Explore/Mobile/Portrait/explorePortraitBody.dart';

//importing providers
import '../../../../../providers/ExploreScr/toursState.dart';

//impoting themes
import '../../../../../Themes/color.dart';

class ExploreScreenMobilePortrait extends StatefulWidget {
  const ExploreScreenMobilePortrait();

  @override
  _ExploreScreenMobilePortraitState createState() =>
      _ExploreScreenMobilePortraitState();
}

class _ExploreScreenMobilePortraitState
    extends State<ExploreScreenMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        final height = sizeInfo.screenSize.height;
        final width = sizeInfo.screenSize.width;
        return Container(
          height: height,
          width: width,
          color: bgColor,
          child: Column(
            children: [
              buildExploreScrAppBar(width: width),
              buildServers(),
              buildGamesAvailable(),
              Expanded(child: ExploreScrTourList()),
            ],
          ),
        );
      },
    );
  }
}
