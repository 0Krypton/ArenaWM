//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

//importing widgets
import './AuthBgTitle.dart';
import './PositionedImg.dart';

//importing providers
import '../../../providers/Auth/authWidgetsState.dart';
import '../../../providers/Auth/authImgsState.dart';

//importing dart files
import 'dart:math' as math;

class AuthBg extends StatelessWidget {
  const AuthBg();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final state = watch(authWidgetsState);
        final height = watch(authWidgetsState).heightBg;
        final width = watch(authWidgetsState).widthBg;

        return AnimatedPositioned(
          curve: Curves.ease,
          duration: const Duration(milliseconds: 1000),
          left: watch(authWidgetsState).authBgPosLeft,
          top: state.authBgPostTop,
          child: GestureDetector(
            onTap: context.read(authWidgetsState).toggleView,
            child: Container(
              height: state.heightBg,
              width: state.widthBg,
              decoration: BoxDecoration(
                color: const Color(0xFFCAF0FF),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFBFF3FF),
                    blurRadius: 50,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    curve: Curves.ease,
                    top: watch(authWidgetsState).isLogin ? 0.0 : 200,
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedOpacity(
                      curve: Curves.ease,
                      opacity: watch(authWidgetsState).isLogin ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        height: state.heightBg,
                        width: state.widthBg,
                        child: const AuthBgTitle(
                          title: 'REGISTER',
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.ease,
                    top: watch(authWidgetsState).isLogin ? -200.0 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedOpacity(
                      curve: Curves.ease,
                      opacity: watch(authWidgetsState).isLogin ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        height: state.heightBg,
                        width: state.widthBg,
                        child: const AuthBgTitle(
                          title: 'LOGIN',
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      PositionedImg(
                        imgUrl: circles[0],
                        width: height * .2,
                        height: height * .2,
                        hasTop: true,
                        hasRight: true,
                        right: 350,
                        top: -(height * .2) / 2,
                      ),
                      PositionedImg(
                        imgUrl: circles[3],
                        width: height * .2,
                        height: height * .2,
                        angle: math.pi * .35,
                        hasTop: true,
                        hasLeft: true,
                        top: height * .15,
                        left: -100 / 2,
                      ),
                      PositionedImg(
                        imgUrl: pluses[0],
                        height: height * .18,
                        width: height * .18,
                        angle: math.pi / 4,
                        hasTop: true,
                        hasLeft: true,
                        top: height * .2,
                        left: 180,
                      ),
                      PositionedImg(
                        imgUrl: squares[0],
                        height: height * .13,
                        width: height * .13,
                        angle: math.pi / 4,
                        hasTop: true,
                        hasLeft: true,
                        top: height * .3,
                        left: 350,
                      ),
                      PositionedImg(
                        imgUrl: circles[0],
                        height: height * .23,
                        width: height * .23,
                        angle: 0,
                        hasBottom: true,
                        hasLeft: true,
                        bottom: height * .2,
                        left: width * .13,
                      ),
                      PositionedImg(
                        imgUrl: circles[3],
                        height: height * .18,
                        width: height * .18,
                        angle: -math.pi / 12,
                        hasBottom: true,
                        hasLeft: true,
                        bottom: 30,
                        left: (width / 2) - ((height * .18) / 2),
                      ),
                      PositionedImg(
                        imgUrl: squares[3],
                        height: height * .18,
                        width: height * .18,
                        angle: -math.pi / 12,
                        hasTop: true,
                        hasRight: true,
                        top: (height / 2) + ((height * .18) / 5),
                        right: 250,
                      ),
                      PositionedImg(
                        imgUrl: pluses[3],
                        height: height * .25,
                        width: height * .25,
                        angle: -math.pi / 4,
                        hasBottom: true,
                        hasRight: true,
                        bottom: -20,
                        right: 30,
                      ),
                      PositionedImg(
                        imgUrl: triangles[1],
                        height: height * .18,
                        width: height * .18,
                        angle: -math.pi / 3,
                        hasTop: true,
                        hasRight: true,
                        top: height * .15,
                        right: width * .15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
