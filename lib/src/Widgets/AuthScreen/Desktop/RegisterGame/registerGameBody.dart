//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing providers
import '../../../../providers/Auth/authWidgetsState.dart';

//importing themes
import '../../../../Themes/color.dart';

//importing widgets
import '../../../customBtn.dart';
import './gameContainer.dart';

//importing screens
import '../RegisterRegion/registerScrRegion.dart';

class RegisterGameBody extends StatelessWidget {
  const RegisterGameBody();

  final paddingHr = 20.0;

  @override
  Widget build(BuildContext context) {
    final widgetsState = context.read(authWidgetsState);

    return Stack(
      children: [
        Positioned(
          left: (widgetsState.registerBodyPos).abs(),
          top: 0,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: widgetsState.widthScr * .5,
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 30,
                  bottom: 30,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFBFF3FF),
                      blurRadius: 50,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _header(),
                    SizedBox(height: 20),
                    _body(width: widgetsState.widthScr * .5),
                    SizedBox(height: 20),
                    _buildButtons(context: context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtons({required BuildContext context}) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onTapCallBack: () {
              Navigator.of(context).pop();
            },
            title: 'BACK',
            fontFamily: 'Noir',
            borderRadius: 10,
            blurRadius: 20,
            bgColor: const Color(0xFFC5F5FF),
            shadowColor: const Color(0xFFB5F1FF),
            textColor: const Color(0xFF52C2EF),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: CustomButton(
            onTapCallBack: () {
              Navigator.of(context).push(
                RegisterRegionScreenDesktop.comeToPage(),
              );
            },
            title: 'NEXT',
            fontFamily: 'Noir',
            borderRadius: 10,
            blurRadius: 20,
            bgColor: const Color(0xFF9AE2FF),
            shadowColor: const Color(0xFF74D7FF),
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _body({required double width}) {
    final double gameContainerWidth = 150;
    final double gameContainerHeight = 90;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GameContainer(
              name: 'fortnite',
              width: gameContainerWidth,
              height: gameContainerHeight,
              color: fortniteColor,
              shadowColor: fortniteShadowColor,
              imageUrl: 'assets/game_icons/fortnite/fortniteTitlePng.png',
            ),
            SizedBox(width: 20),
            GameContainer(
              name: 'valorant',
              width: gameContainerWidth,
              height: gameContainerHeight,
              color: valorantColor,
              shadowColor: valorantShadowColor,
              imageUrl:
                  'assets/game_icons/valorant/valorantLogoWithTitlePng.png',
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GameContainer(
              name: 'apex',
              width: gameContainerWidth,
              height: gameContainerHeight,
              color: apexlegendsColor,
              shadowColor: apexlegendsShadowColor,
              imageUrl: 'assets/game_icons/apex/apexLogoWithTitlePng.png',
            ),
            SizedBox(width: 20),
            GameContainer(
              name: 'rainbowsix',
              width: gameContainerWidth,
              height: gameContainerHeight,
              color: rainbowsixColor,
              shadowColor: rainbowsixShadowColor,
              imageUrl:
                  'assets/game_icons/rainbowsix/rainbowsixLogoWithTitlePng.png',
            ),
          ],
        ),
        SizedBox(height: 25),
      ],
    );
  }

  Widget _header() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          child: Image.asset(
            'assets/form/controllerButtonsPng.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 15),
        SelectableText(
          'What type of game\nare you play?',
          style: TextStyle(
            height: 1.2,
            color: const Color(0xFF006B96),
            fontSize: 15,
            fontFamily: 'Reglo',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
