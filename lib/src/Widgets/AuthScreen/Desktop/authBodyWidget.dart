//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing providers
import '../../../providers/Auth/authWidgetsState.dart';

//importing login & registeration body
import './loginBody.dart';
import './registerBody.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final state = watch(authWidgetsState);
        return Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.ease,
              duration: const Duration(milliseconds: 700),
              left: state.authBodyPos,
              top: 0,
              bottom: 0,
              child: Offstage(
                offstage: state.loginBodyOpacity == 0 ? true : false,
                child: AnimatedOpacity(
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 1000),
                  opacity: state.loginBodyOpacity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: state.widthBody,
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 30,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFBFF3FF),
                              blurRadius: 50,
                            ),
                          ],
                        ),
                        child: const LoginBody(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.ease,
              duration: const Duration(milliseconds: 700),
              left: state.authBodyPos,
              top: 0,
              bottom: 0,
              child: Offstage(
                offstage: state.registerBodyOpacity == 0 ? true : false,
                child: AnimatedOpacity(
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 1000),
                  opacity: state.registerBodyOpacity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: state.widthBody,
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 30,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFBFF3FF),
                              blurRadius: 50,
                            ),
                          ],
                        ),
                        child: const RegisterBody(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
