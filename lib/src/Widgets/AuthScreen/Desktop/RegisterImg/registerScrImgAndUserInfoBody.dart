//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

//importing providers
import '../../../../providers/Auth/authenticationState.dart';
import '../../../../providers/Auth/authWidgetsState.dart';

//importing widgets
import '../../../CustomTextField.dart';
import '../../../customBtn.dart';
import '../../../counterVlidator.dart';

//importing screens
import '../RegisterGame/registerScreenGame.dart';

class RegisterImgAndUserInfo extends StatefulWidget {
  const RegisterImgAndUserInfo();

  @override
  _RegisterImgAndUserInfoState createState() => _RegisterImgAndUserInfoState();
}

class _RegisterImgAndUserInfoState extends State<RegisterImgAndUserInfo>
    with TickerProviderStateMixin {
  int bioEnteredLenght = 150;
  int extraEnteredBio = 0;

  late AnimationController fNameColorController;
  late AnimationController lNameColorController;
  late AnimationController bioColorController;

  late AnimationController bioScaleAnimController;

  late TextEditingController fNameTxtController;
  late TextEditingController lNameTxtController;
  late TextEditingController bioTxtController;

  late FocusNode fNameFocusNode;
  late FocusNode lNameFocusNode;
  late FocusNode bioFocusNode;

  @override
  void initState() {
    super.initState();

    fNameFocusNode = new FocusNode();
    bioFocusNode = new FocusNode();
    lNameFocusNode = new FocusNode();

    fNameColorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    lNameColorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    bioColorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    bioScaleAnimController = AnimationController(
        vsync: this, value: 0.0, duration: const Duration(milliseconds: 300));

    bioScaleAnimController.addListener(() {});

    fNameTxtController =
        TextEditingController(text: context.read(authentication).sFName)
          ..addListener(() {});
    lNameTxtController =
        TextEditingController(text: context.read(authentication).sLName)
          ..addListener(() {});
    bioTxtController =
        TextEditingController(text: context.read(authentication).sBio)
          ..addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    fNameColorController.dispose();
    lNameColorController.dispose();
    bioColorController.dispose();

    fNameFocusNode.dispose();
    bioFocusNode.dispose();
    lNameFocusNode.dispose();

    bioScaleAnimController.dispose();

    fNameTxtController.dispose();
    lNameTxtController.dispose();
    bioTxtController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widgetsState = context.read(authWidgetsState);
    return Consumer(builder: (context, watch, child) {
      final authState = watch(authentication);
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
                  child:
                      _body(widgetsState: widgetsState, authState: authState),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _body(
      {required widgetsState, required AuthenticationState authState}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _bgAndProfileImgAndInfoContainer(
            widgetsState: widgetsState, authState: authState),
        _fNameAndlName(),
        SizedBox(height: 10),
        _bio(authState: authState),
        SizedBox(height: 15),
        _buildButtons(),
      ],
    );
  }

  Widget _buildButtons() {
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
              Navigator.of(context).push(RegisterGame.comeToPage());
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

  Widget _bio({required AuthenticationState authState}) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: 120,
          child: CustomTextField(
            controller: bioTxtController,
            isExpands: true,
            labelText: 'Bio',
            maxLines: 5,
            minLines: 5,
            focusNode: bioFocusNode,
            nextFocusNode: bioFocusNode,
            colorAnimController: bioColorController,
            onChange: (bio) {
              if (bio.trim().length <= 150) {
                bioScaleAnimController.forward();
              } else if (bio.trim().length > 150) {
                bioColorController.forward();
                extraEnteredBio = bio.trim().length - 150;
              }
              context.read(authentication).setBio(bio);
            },
            onSubmit: (bio) {
              context.read(authentication).setBio(bio);
            },
          ),
        ),
        Positioned(
          bottom: -(15 / 2),
          right: 15,
          child: TextFieldCounter(
            count: authState.sBio.length,
            isValid: authState.sBio.length <= 150,
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
            scaleAnimationController: bioScaleAnimController,
          ),
        )
      ],
    );
  }

  Widget _fNameAndlName() {
    return Row(
      children: [
        _fName(),
        SizedBox(width: 20),
        _lName(),
      ],
    );
  }

  Widget _lName() {
    return Expanded(
      child: Container(
        height: 50,
        child: CustomTextField(
          controller: lNameTxtController,
          labelText: 'LastName',
          focusNode: lNameFocusNode,
          nextFocusNode: bioFocusNode,
          colorAnimController: lNameColorController,
          onChange: (lName) {
            context.read(authentication).setSLName(lName);
          },
          onSubmit: (lName) {
            context.read(authentication).setSLName(lName);
          },
        ),
      ),
    );
  }

  Widget _fName() {
    return Expanded(
      child: Container(
        height: 50,
        child: CustomTextField(
          controller: fNameTxtController,
          labelText: 'FirstName',
          focusNode: fNameFocusNode,
          nextFocusNode: lNameFocusNode,
          colorAnimController: fNameColorController,
          onChange: (fName) {
            context.read(authentication).setSFName(fName);
          },
          onSubmit: (fName) {
            context.read(authentication).setSFName(fName);
          },
        ),
      ),
    );
  }

  Widget _bgAndProfileImgAndInfoContainer(
      {required widgetsState, required authState}) {
    final containerHeight = (widgetsState.heightBg) / 3;
    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.only(
          topLeft: const Radius.circular(15),
          topRight: const Radius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          _bgImg(height: containerHeight / 2),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 50),
                _profileImg(heightAndWidth: containerHeight * .7),
                SizedBox(width: 20),
                _info(height: containerHeight * .6, authState: authState),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _info({required height, required AuthenticationState authState}) {
    return Expanded(
      child: Container(
        height: height,
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(const Radius.circular(15)),
          boxShadow: [
            const BoxShadow(color: const Color(0xFFBAEAF4), blurRadius: 30),
          ],
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                authState.sUsername.isNotEmpty
                    ? authState.sUsername
                    : '@UserName',
                style: TextStyle(
                  color: const Color(0xFF006B96),
                  fontFamily: 'Reglo',
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SelectableText(
                    authState.sFName.isNotEmpty
                        ? authState.sFName
                        : 'Your firstName',
                    style: TextStyle(
                      color: const Color(0xFFA3D9E5),
                      fontFamily: 'Reglo',
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 15),
                  SelectableText(
                    authState.sLName.isNotEmpty
                        ? authState.sLName
                        : 'Your lasName',
                    style: TextStyle(
                      color: const Color(0xFFA3D9E5),
                      fontFamily: 'Reglo',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SelectableText(
                authState.sBio.isNotEmpty ? authState.sBio : 'Bio',
                style: TextStyle(
                  color: const Color(0xFF006B96),
                  fontFamily: 'Reglo',
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImg({required heightAndWidth}) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.transparent,
      child: Container(
        height: heightAndWidth,
        width: heightAndWidth,
        padding: const EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          color: const Color(0xFFE8FBFF),
          shape: BoxShape.circle,
          boxShadow: [
            const BoxShadow(color: const Color(0xFFBAEAF4), blurRadius: 30),
          ],
        ),
        child: SvgPicture.asset(
          'assets/form/camera.svg',
        ),
      ),
    );
  }

  Widget _bgImg({required height}) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.transparent,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFE8FBFF),
          borderRadius: const BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
