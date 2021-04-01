//importing packages
import 'package:animations/animations.dart';
import 'package:app_v2/src/providers/btn_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing widgets
import '../../../../Widgets/responsive_builder.dart';
import '../../../../Widgets/MainScreen/Mobile/Portrait/Btn/mobilePortraitBTN.dart';

//importing screens for ---MOBILE PORTRAIT MODE---
import '../../../NavigationScreens/Profile/DeviceLayout/Mobile/profileScreenMobilePortrait.dart';
import '../../../NavigationScreens/Explore/DeviceLayout/Mobile/exploreScreenMobilePortrait.dart';
import '../../../NavigationScreens/Home/DeviceLayout/Mobile/homeScreenMobilePortrait.dart';
import '../../../NavigationScreens/Top/DeviceLayout/Mobile/topScreenMobilePortrait.dart';
import '../../../NavigationScreens/Store/DeviceLayout/Mobile/storeScreenMobilePortrait.dart';

//importing provider
import '../../../../providers/SideBar/sideBarState.dart';

//importing themes
import '../../../../Themes/color.dart';

const List<Widget> pages = [
  const StoreScreenMobilePortrait(),
  const TopScreenMobilePortrait(),
  const HomeScreenMobilePortrait(),
  const ExploreScreenMobilePortrait(),
  const ProfileScreenMobilePortrait(),
];

class MainScreenMobilePortrait extends StatefulWidget {
  @override
  _MainScreenMobilePortraitState createState() =>
      _MainScreenMobilePortraitState();
}

class _MainScreenMobilePortraitState extends State<MainScreenMobilePortrait>
    with TickerProviderStateMixin {
  late final AnimationController _scaleController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
    _scaleAnimation =
        CurvedAnimation(parent: _scaleController, curve: Curves.easeInBack);
  }

  @override
  void didChangeDependencies() {
    context.read(sideBarState).setController(_scaleController);
    _scaleController.addListener(() {
      context.read(sideBarState).setAnimationValue(_scaleController.value);
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Build MainScreenMobilePortrait');
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        final height = sizeInfo.screenSize.height;
        final width = sizeInfo.screenSize.width;

        final widthWithScale = (width - (width * .7));

        return Scaffold(
          backgroundColor: bgColor,
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                width: width,
                height: height,
                color: bgColor,
              ),
              Consumer(
                builder: (context, watch, child) {
                  final double animationValue =
                      watch(sideBarState).animationValue;
                  final Color? shadowTweeAnim =
                      watch(sideBarState).shadowTweenColor.value;

                  return Align(
                    alignment: Alignment.center,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(-(animationValue * widthWithScale))
                        ..scale(
                          1 - (0.3 * _scaleAnimation.value),
                        ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: shadowTweeAnim,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0 * animationValue),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: shadowTweeAnim!,
                              blurRadius: 30,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0 * animationValue),
                          ),
                          child: child,
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: height,
                  width: width,
                  child: Stack(
                    children: [
                      //Pages
                      Consumer(
                        builder: (context, watch, child) {
                          int selectedIndex = watch(btnIndexProvider.state);

                          return PageTransitionSwitcher(
                            duration: const Duration(milliseconds: 800),
                            transitionBuilder: (
                              Widget child,
                              Animation<double> primaryAnimation,
                              Animation<double> secondaryAnimation,
                            ) {
                              return FadeThroughTransition(
                                animation: primaryAnimation,
                                secondaryAnimation: secondaryAnimation,
                                child: child,
                              );
                            },
                            child: pages[selectedIndex],
                          );
                        },
                      ),
                      //Btn
                      MobilePortraitBTN(width: width),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
