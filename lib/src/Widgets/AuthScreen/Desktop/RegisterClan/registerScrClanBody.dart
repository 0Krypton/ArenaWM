//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing providers
import '../../../../providers/Auth/authenticationState.dart';
import '../../../../providers/Auth/authWidgetsState.dart';

//importing widgets
import '../../../CustomTextField.dart';
import '../../../counterVlidator.dart';
import '../../../customBtn.dart';

class RegisterClanBody extends StatefulWidget {
  const RegisterClanBody();

  @override
  _RegisterClanBodyState createState() => _RegisterClanBodyState();
}

class _RegisterClanBodyState extends State<RegisterClanBody>
    with TickerProviderStateMixin {
  final paddingHr = 20.0;

  late AnimationController clanNameColorController;
  late AnimationController clanNameScaleAnimController;

  late TextEditingController clanNameTxtController;

  late FocusNode clanNameFocusNode;

  @override
  void initState() {
    super.initState();

    clanNameFocusNode = new FocusNode();

    clanNameColorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    clanNameScaleAnimController = AnimationController(
      vsync: this,
      value: 0.0,
      duration: const Duration(milliseconds: 300),
    );

    clanNameScaleAnimController.addListener(() {
      setState(() {});
    });

    clanNameTxtController =
        TextEditingController(text: context.read(authentication).sClanName)
          ..addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();

    clanNameFocusNode.dispose();

    clanNameColorController.dispose();
    clanNameScaleAnimController.dispose();

    clanNameTxtController.dispose();
  }

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
                    _clanName(),
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

  Widget _clanName() {
    return Consumer(builder: (context, watch, child) {
      final authState = watch(authentication);
      return Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            height: 50,
            width: 400,
            child: CustomTextField(
              controller: clanNameTxtController,
              isExpands: false,
              labelText: 'Clan/Team Name',
              maxLines: 1,
              maxLength: 30,
              limit: 4,
              minLines: 1,
              focusNode: clanNameFocusNode,
              nextFocusNode: clanNameFocusNode,
              colorAnimController: clanNameColorController,
              onChange: (clanName) {
                if (clanName.length > 0) {
                  clanNameScaleAnimController.forward();
                  context.read(authentication).setSClanName(clanName);
                } else {
                  clanNameScaleAnimController.reverse();
                }
              },
              onSubmit: (clanName) {
                context.read(authentication).setSClanName(clanName);
              },
            ),
          ),
          Positioned(
            bottom: -(15 / 2),
            right: 15,
            child: TextFieldCounter(
              count: authState.sClanName.length,
              isValid: authState.sClanName.length >= 4,
              height: 15,
              verticalPadding: 2,
              radius: 6,
              beginScale: 0.0,
              middleOneScale: 1.3,
              middleTwoScale: 0.7,
              endScale: 1.0,
              bgColor: const Color(0xFF26C3FF),
              bgErrorColor: Colors.red[700],
              textColor: Colors.white,
              errorTextColor: Colors.white,
              scaleAnimationController: clanNameScaleAnimController,
            ),
          )
        ],
      );
    });
  }

  Widget _header() {
    return Column(
      children: [
        Container(
          child: Stack(
            overflow: Overflow.visible,
            children: [
              InkWell(
                onTap: () {
                  print('Image tapped');
                },
                child: Stack(
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      child: Image.asset(
                        'assets/form/iconSafteyPng.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 35,
                      bottom: 180 / 5,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFCFCFC),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF74D7FF),
                              blurRadius: 30,
                            ),
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/form/camera.svg',
                            color: const Color(0xFF00A1E1),
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SelectableText(
          'ESTeam Info',
          style: TextStyle(
            height: 1.2,
            color: const Color(0xFF006B96),
            fontSize: 15,
            fontFamily: 'Reglo',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SelectableText(
          'If you have joined to a clan\nor Esport Team Please enter the name\n& upload your clan/team logo',
          style: TextStyle(
            height: 1.2,
            color: const Color(0xFF36AEDE),
            fontSize: 12,
            fontFamily: 'Reglo',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
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
              context.read(authentication).registerUser();
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
}
