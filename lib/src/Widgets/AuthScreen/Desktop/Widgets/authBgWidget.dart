//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

//importing widgets
import 'AuthBgTitle.dart';
import 'PositionedImg.dart';

//importing providers
import '../../../../providers/Auth/authWidgetsState.dart';
import '../../../../providers/Auth/authImgsState.dart';

//importing dart files
import 'dart:math' as math;

class AuthBg extends StatelessWidget {
  const AuthBg();

  @override
  Widget build(BuildContext context) {
    final heightR = MediaQuery.of(context).size.height * .75;
    final widthR = MediaQuery.of(context).size.width * .6;

    return Consumer(
      builder: (context, watch, Widget? child) {
        final state = watch(authWidgetsState);
        return AnimatedPositioned(
          curve: Curves.ease,
          duration: const Duration(milliseconds: 1000),
          left: state.authBgPosLeft,
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
                    top: state.isLogin ? 0.0 : 200,
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedOpacity(
                      curve: Curves.ease,
                      opacity: state.isLogin ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        height: state.heightBg,
                        width: state.widthBg,
                        child: const AuthBgTitle(title: 'REGISTER'),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.ease,
                    top: state.isLogin ? -200.0 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedOpacity(
                      curve: Curves.ease,
                      opacity: state.isLogin ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        height: state.heightBg,
                        width: state.widthBg,
                        child: const AuthBgTitle(title: 'LOGIN'),
                      ),
                    ),
                  ),
                  child!,
                ],
              ),
            ),
          ),
        );
      },
      child: Stack(
        children: [
          PositionedImg(
            imgUrl: circles[0],
            width: heightR * .2,
            height: heightR * .2,
            hasTop: true,
            hasRight: true,
            right: 350,
            top: -(heightR * .2) / 2,
          ),
          PositionedImg(
            imgUrl: circles[3],
            width: heightR * .2,
            height: heightR * .2,
            angle: math.pi * .35,
            hasTop: true,
            hasLeft: true,
            top: heightR * .15,
            left: -100 / 2,
          ),
          PositionedImg(
            imgUrl: pluses[0],
            height: heightR * .18,
            width: heightR * .18,
            angle: math.pi / 4,
            hasTop: true,
            hasLeft: true,
            top: heightR * .2,
            left: 180,
          ),
          PositionedImg(
            imgUrl: squares[0],
            height: heightR * .13,
            width: heightR * .13,
            angle: math.pi / 4,
            hasTop: true,
            hasLeft: true,
            top: heightR * .3,
            left: 350,
          ),
          PositionedImg(
            imgUrl: circles[0],
            height: heightR * .23,
            width: heightR * .23,
            angle: 0,
            hasBottom: true,
            hasLeft: true,
            bottom: heightR * .2,
            left: widthR * .13,
          ),
          PositionedImg(
            imgUrl: circles[3],
            height: heightR * .18,
            width: heightR * .18,
            angle: -math.pi / 12,
            hasBottom: true,
            hasLeft: true,
            bottom: 30,
            left: (widthR / 2) - ((heightR * .18) / 2),
          ),
          PositionedImg(
            imgUrl: squares[3],
            height: heightR * .18,
            width: heightR * .18,
            angle: -math.pi / 12,
            hasTop: true,
            hasRight: true,
            top: (heightR / 2) + ((heightR * .18) / 5),
            right: 250,
          ),
          PositionedImg(
            imgUrl: pluses[3],
            height: heightR * .25,
            width: heightR * .25,
            angle: -math.pi / 4,
            hasBottom: true,
            hasRight: true,
            bottom: -20,
            right: 30,
          ),
          PositionedImg(
            imgUrl: triangles[1],
            height: heightR * .18,
            width: heightR * .18,
            angle: -math.pi / 3,
            hasTop: true,
            hasRight: true,
            top: heightR * .15,
            right: widthR * .15,
          ),
        ],
      ),
    );
  }
}
