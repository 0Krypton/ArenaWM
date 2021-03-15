//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing themes
import '../../../../../Themes/color.dart';

//importing utils
import '../../../../../utils/getAssets.dart';

//importing widgets
import './mobilePortraitBTNItem.dart';

//importing providers
import '../../../../../providers/btn_state_notifier.dart';

class MobilePortraitBTN extends StatefulWidget {
  MobilePortraitBTN({required this.width});

  final double width;

  @override
  _MobilePortraitBTNState createState() => _MobilePortraitBTNState();
}

class _MobilePortraitBTNState extends State<MobilePortraitBTN>
    with TickerProviderStateMixin {
  final double posFromSides = 15;
  final double padVertical = 10;
  final double padHorizontal = 20;
  final double movingContainerPos = 10.0;

  late final double widthBtn, widthItemsContainer, widthItemArea;

  final BorderRadius borderRadius = BorderRadius.all(Radius.circular(10));

  late AnimationController btnContainerController;
  late AnimationController btnMovingContainerController;
  late Animation<double> btnContainerPosition;
  late Animation<double> btnMovingContainerPosition;

  late AnimationController controllerOne;
  late AnimationController controllerTwo;
  late AnimationController controllerThree;
  late AnimationController controllerFour;
  late AnimationController controllerFive;

  late List<AnimationController> controllers = [
    controllerOne,
    controllerTwo,
    controllerThree,
    controllerFour,
    controllerFive,
  ];

  @override
  void initState() {
    super.initState();
    widthBtn = widget.width - (posFromSides * 2);
    widthItemsContainer = widthBtn - (padHorizontal * 2);
    widthItemArea = widthItemsContainer / 5;

    //initializing controllers

    btnContainerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..addListener(() {
        setState(() {});
      });

    btnMovingContainerController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 1100,
        ))
      ..addListener(() {
        setState(() {});
      });

    btnContainerPosition = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: -(60 + posFromSides),
            end: (posFromSides + 15.0),
          ),
          weight: 40.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: (posFromSides + 15.0),
            end: posFromSides - 5.0,
          ),
          weight: 20.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: posFromSides - 5.0,
            end: posFromSides,
          ),
          weight: 40.0,
        ),
      ],
    ).animate(btnContainerController);

    btnMovingContainerPosition = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: -(movingContainerPos + 10),
            end: movingContainerPos + 5.0,
          ),
          weight: 40.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: movingContainerPos + 5.0,
            end: movingContainerPos - 5.0,
          ),
          weight: 20.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: movingContainerPos - 5.0,
            end: movingContainerPos,
          ),
          weight: 40.0,
        ),
      ],
    ).animate(btnContainerController);

    btnContainerController.forward();
    btnMovingContainerController.forward();

    controllerOne = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    controllerTwo = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    controllerThree = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    controllerFour = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    controllerFive = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  @override
  void dispose() {
    super.dispose();
    btnContainerController.dispose();
    btnMovingContainerController.dispose();

    controllerOne.dispose();
    controllerTwo.dispose();
    controllerThree.dispose();
    controllerFour.dispose();
    controllerFive.dispose();

    controllers = [];
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: posFromSides,
      right: posFromSides,
      // bottom: btnContainerController.value * posFromSides,
      bottom: btnContainerPosition.value,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 15),
          ],
        ),
        child: Stack(
          children: [
            _movingContainer(),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _movingContainer() {
    return Consumer(
      builder: (context, watch, child) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutBack,
          left: padHorizontal +
              (widthItemArea * watch(btnIndexProvider.state)) +
              (widthItemArea / 2) -
              20,
          bottom: btnMovingContainerPosition.value,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colors[watch(btnIndexProvider.state)],
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: colors[watch(btnIndexProvider.state)],
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _body() {
    return Container(
      width: widthBtn,
      padding: EdgeInsets.symmetric(
        vertical: padVertical,
        horizontal: padHorizontal,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: borderRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: List.generate(
          5,
          (index) => MobilePortraitBtnItem(
            width: widthItemArea,
            iconUrl: assets[index],
            color: colors[index],
            index: index,
            controller: controllers[index],
          ),
        ),
      ),
    );
  }
}
