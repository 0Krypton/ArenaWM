//importing pacakges
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrouter/vrouter.dart';

//importing themes
import '../../../Themes/color.dart';

//importing providers
import '../../../providers/Auth/authenticationState.dart';

//importing widgets
import '../../CustomTextField.dart';

//importing extendsions
import '../../../utils/validators.dart';

class LoginBody extends StatefulWidget {
  const LoginBody();

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> with TickerProviderStateMixin {
  bool _isVisibleLogin = true;

  late AnimationController emailLoginColorController;
  late AnimationController passwordLoginColorController;

  late TextEditingController emailLoginTxtController;
  late TextEditingController passwordLoginTxtController;

  late FocusNode emailLoginFocusNode;
  late FocusNode passwordLoginFocusNode;

  @override
  void initState() {
    super.initState();

    emailLoginFocusNode = new FocusNode();
    passwordLoginFocusNode = new FocusNode();

    emailLoginColorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    passwordLoginColorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    emailLoginTxtController = TextEditingController(text: '')
      ..addListener(() {});

    passwordLoginTxtController = TextEditingController(text: '')
      ..addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    emailLoginColorController.dispose();
    passwordLoginColorController.dispose();

    emailLoginFocusNode.dispose();
    passwordLoginFocusNode.dispose();

    emailLoginTxtController.dispose();
    passwordLoginTxtController.dispose();
  }

  bool isHoveredBtn = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Login',
          style: const TextStyle(
              fontFamily: 'Noir', fontSize: 25, color: arenaLogoColor),
        ),
        const SizedBox(height: 15),
        Container(
          height: 50,
          child: CustomTextField(
            controller: emailLoginTxtController,
            labelText: 'Email',
            focusNode: emailLoginFocusNode,
            type: 'email',
            nextFocusNode: passwordLoginFocusNode,
            prefixIconUrl: 'assets/form/emailPng.png',
            colorAnimController: emailLoginColorController,
            onChange: (email) {
              context.read(authentication).setlEmail(email);
            },
            onSubmit: (email) {
              context.read(authentication).setlEmail(email);
            },
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 50,
          child: CustomTextField(
            controller: passwordLoginTxtController,
            labelText: 'Password',
            type: 'password',
            focusNode: passwordLoginFocusNode,
            nextFocusNode: passwordLoginFocusNode,
            prefixIconUrl: 'assets/form/securePng.png',
            colorAnimController: passwordLoginColorController,
            isObscure: _isVisibleLogin,
            isPasswordField: true,
            onChange: (password) {
              context.read(authentication).setlPassword(password);
            },
            onSubmit: (password) {
              context.read(authentication).setlPassword(password);
            },
            suffixOnPressed: () {
              setState(() {
                _isVisibleLogin = !_isVisibleLogin;
              });
            },
          ),
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: () {
            if (!emailLoginTxtController.text.validateEmail) {
              emailLoginColorController.forward();
              emailLoginFocusNode.requestFocus();
              return;
            }
            if (!passwordLoginTxtController.text.validatePassword) {
              passwordLoginColorController.forward();
              passwordLoginFocusNode.requestFocus();
              return;
            }
            emailLoginFocusNode.unfocus();
            passwordLoginFocusNode.unfocus();

            //if loginUser returns Exception don't navigate and show errorDialog
            context.read(authentication).loginUser();
            // VRouterData.of(context).pushReplacement('/');
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 50,
            decoration: BoxDecoration(
              color: isHoveredBtn
                  ? const Color(0xFF009CDA)
                  : const Color(0xFF9AE2FF),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: isHoveredBtn
                      ? const Color(0xFF009CDA)
                      : const Color(0xFF74D7FF),
                  blurRadius: 20,
                ),
              ],
            ),
            child: const Center(
              child: const Text(
                'Login',
                style: const TextStyle(
                  fontFamily: 'Noir',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            Text(
              'Don\'t remember your password?',
              style: const TextStyle(
                fontFamily: 'Reglo',
                fontSize: 12,
                color: const Color(0xFF74D7FF),
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {
                print('Get help reset password');
              },
              child: const Text(
                'Get Help',
                style: const TextStyle(
                  fontFamily: 'Reglo',
                  fontSize: 15,
                  color: arenaLogoColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
