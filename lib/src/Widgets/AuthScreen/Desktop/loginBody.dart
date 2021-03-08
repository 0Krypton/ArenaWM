//importing pacakges
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing themes
import '../../../Themes/color.dart';

//importing providers
import '../../../providers/Auth/authenticationState.dart';

//importing widgets
import '../../CustomTextField.dart';

class LoginBody extends StatefulWidget {
  const LoginBody();

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> with TickerProviderStateMixin {
  bool _isVisibleLogin = true;

  late AnimationController emailLoginColorController;
  late AnimationController passwordLoginColorController;

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
  }

  @override
  void dispose() {
    super.dispose();
    emailLoginColorController.dispose();
    passwordLoginColorController.dispose();

    emailLoginFocusNode.dispose();
    passwordLoginFocusNode.dispose();
  }

  bool isHoveredBtn = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Login',
          style: TextStyle(
            fontFamily: 'Noir',
            fontSize: 25,
            color: arenaLogoColor,
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 50,
          child: CustomTextField(
            labelText: 'Email',
            focusNode: emailLoginFocusNode,
            type: 'email',
            nextFocusNode: passwordLoginFocusNode,
            prefixIconUrl: 'assets/form/emailPng.png',
            colorAnimController: emailLoginColorController,
            onChanged: (email) {
              context.read(authentication).setlEmail(email);
            },
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 50,
          child: CustomTextField(
            labelText: 'Password',
            type: 'password',
            focusNode: passwordLoginFocusNode,
            nextFocusNode: passwordLoginFocusNode,
            prefixIconUrl: 'assets/form/securePng.png',
            colorAnimController: passwordLoginColorController,
            isObscure: _isVisibleLogin,
            isPasswordField: true,
            onChanged: (password) {
              context.read(authentication).setlPassword(password);
            },
            suffixOnPressed: () {
              setState(() {
                _isVisibleLogin = !_isVisibleLogin;
              });
            },
          ),
        ),
        SizedBox(height: 15),
        InkWell(
          onTap: context.read(authentication).loginUser,
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
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Noir',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 25),
        Row(
          children: [
            Text(
              'Don\'t remember your password?',
              style: TextStyle(
                fontFamily: 'Reglo',
                fontSize: 12,
                color: const Color(0xFF74D7FF),
              ),
            ),
            SizedBox(width: 5),
            InkWell(
              onTap: () {
                print('Get help reset password');
              },
              child: Text(
                'Get Help',
                style: TextStyle(
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
