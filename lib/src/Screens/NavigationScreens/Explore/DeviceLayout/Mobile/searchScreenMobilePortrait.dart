//importing packages

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing widgets
import '../../../../../Widgets/responsive_builder.dart';
import '../../../../../Widgets/Pages/Explore/Mobile/Portrait/search/searchTextField.dart';
import '../../../../../Widgets/Pages/Explore/Mobile/Portrait/search/searchResultPage.dart';

//importing providers
import '../../../../../providers/SearchScr/searchWidgetState.dart';
import '../../../../../providers/SearchScr/searchState.dart';

//importing themes
import '../../../../../Themes/color.dart';

class SearchScreenMobilePortrait extends StatefulWidget {
  static Route comeToPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) =>
          SearchScreenMobilePortrait(),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation1, animation2, child) {
        return Opacity(
          opacity: animation1.value,
          child: child,
        );
      },
    );
  }

  @override
  _SearchScreenMobilePortraitState createState() =>
      _SearchScreenMobilePortraitState();
}

class _SearchScreenMobilePortraitState extends State<SearchScreenMobilePortrait>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      value: 1.0,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context
        .read(searchScreenWidgetState)
        .setScaleAnimController(_scaleController);
    _scaleController.addListener(
      () {
        context.read(searchScreenWidgetState).setValues(
              animControllerValue: _scaleController.value,
            );
      },
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        final double height = sizeInfo.screenSize.height;
        final double width = sizeInfo.screenSize.width;

        return Scaffold(
          backgroundColor: bgColor,
          body: Container(
            height: height,
            width: width,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 30,
                  right: 30,
                  top: 70,
                  child: Container(
                    height: 50,
                    child: SearchTextField(),
                  ),
                ),
                buildBackButton(context: context),
                Consumer(
                  builder: (context, watch, child) {
                    double scale =
                        watch(searchScreenWidgetState).scaleAnim.value;
                    double posFromBottom =
                        watch(searchScreenWidgetState).posFromBottom;
                    return Positioned(
                      left: 0,
                      right: 0,
                      child: Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()
                          ..scale(scale)
                          ..translate(0, -posFromBottom),
                        child: _searchScreenRes(
                          height: height,
                          width: width,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _searchScreenRes({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(const Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE2E2E2),
            blurRadius: 50,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Consumer(
        builder: (context, watch, child) {
          bool isSearching = watch(searchState).isSearching;

          if (isSearching) {
            return Center(
              child: Container(
                height: 100,
                width: 100,
                child: FlareActor(
                  'assets/rive/loading-Complicit-Simple.flr',
                  animation: 'Complicit',
                ),
              ),
            );
          } else {
            return SearchResultsPage();
          }
        },
      ),
    );
  }
}
