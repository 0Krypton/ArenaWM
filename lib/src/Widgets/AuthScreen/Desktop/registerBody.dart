//importing pacakges
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrouter/vrouter.dart';

//importing providers
import '../../../providers/Auth/authenticationState.dart';

//importing themes
import '../../../Themes/color.dart';

//importing widgets
import '../../CustomTextField.dart';
import './RegisterImg/registerScreenImgAndUserInfo.dart';

//importing extensions
import '../../../utils/validators.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody();
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody>
    with TickerProviderStateMixin {
  bool _isVisibleRegister = true;
  bool isHoveredBtnRegister = false;

  late AnimationController emailRegisterColorController;
  late AnimationController userNameRegisterColorController;
  late AnimationController passwordRegisterColorController;

  late TextEditingController emailRegisterTxtController;
  late TextEditingController userNameRegisterTxtController;
  late TextEditingController passwordRegisterTxtController;

  late FocusNode emailRegisterFocusNode;
  late FocusNode userNameRegisterFocusNode;
  late FocusNode passwordRegisterFocusNode;

  @override
  void initState() {
    super.initState();

    emailRegisterFocusNode = new FocusNode();
    passwordRegisterFocusNode = new FocusNode();
    userNameRegisterFocusNode = new FocusNode();

    emailRegisterColorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    passwordRegisterColorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    userNameRegisterColorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    emailRegisterTxtController = TextEditingController(text: '')
      ..addListener(() {});
    userNameRegisterTxtController = TextEditingController(text: '')
      ..addListener(() {});
    passwordRegisterTxtController = TextEditingController(text: '')
      ..addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    emailRegisterColorController.dispose();
    passwordRegisterColorController.dispose();
    userNameRegisterColorController.dispose();

    emailRegisterFocusNode.dispose();
    passwordRegisterFocusNode.dispose();
    userNameRegisterFocusNode.dispose();

    emailRegisterTxtController.dispose();
    userNameRegisterTxtController.dispose();
    passwordRegisterTxtController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'REGISTER',
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
              controller: emailRegisterTxtController,
              labelText: 'Email',
              type: 'email',
              focusNode: emailRegisterFocusNode,
              nextFocusNode: userNameRegisterFocusNode,
              colorAnimController: emailRegisterColorController,
              prefixIconUrl: 'assets/form/emailPng.png',
              onChange: (email) {
                context.read(authentication).setSEmail(email);
              },
              onSubmit: (email) {
                print('Email : $email');
              },
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            child: CustomTextField(
              controller: userNameRegisterTxtController,
              labelText: 'User Name',
              type: 'username',
              focusNode: userNameRegisterFocusNode,
              nextFocusNode: passwordRegisterFocusNode,
              prefixIconUrl: 'assets/form/userPng.png',
              colorAnimController: userNameRegisterColorController,
              limit: 4,
              onChange: (username) {
                context.read(authentication).setSUsername(username);
              },
              onSubmit: (userName) {
                print('Username : $userName');
              },
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            child: CustomTextField(
              controller: passwordRegisterTxtController,
              labelText: 'Password',
              type: 'password',
              focusNode: passwordRegisterFocusNode,
              nextFocusNode: passwordRegisterFocusNode,
              prefixIconUrl: 'assets/form/securePng.png',
              colorAnimController: passwordRegisterColorController,
              isObscure: _isVisibleRegister,
              isPasswordField: true,
              onChange: (password) {
                context.read(authentication).setSPassword(password);
              },
              onSubmit: (password) {
                print('Password : $password');
              },
              suffixOnPressed: () {
                setState(() {
                  _isVisibleRegister = !_isVisibleRegister;
                });
              },
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              // if (!emailRegisterTxtController.text.validateEmail) {
              //   emailRegisterColorController.forward();
              //   emailRegisterFocusNode.requestFocus();
              //   return;
              // }

              // if (!userNameRegisterTxtController.text.validateUserName) {
              //   userNameRegisterColorController.forward();
              //   userNameRegisterFocusNode.requestFocus();
              //   return;
              // }

              // if (!passwordRegisterTxtController.text.validatePassword) {
              //   passwordRegisterColorController.forward();
              //   passwordRegisterFocusNode.requestFocus();
              //   return;
              // }

              // emailRegisterFocusNode.unfocus();
              // userNameRegisterFocusNode.unfocus();
              // passwordRegisterFocusNode.unfocus();

              // TODO
              // check to see is username available or not if not show error dialog

              // navigate to next level
              // VRouterData.of(context).push('/');
              // print('registered');
              Navigator.of(context)
                  .push(RegisterImgAndUserInfoScreenDesktop.comeToPage());
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 50,
              decoration: BoxDecoration(
                color: isHoveredBtnRegister
                    ? const Color(0xFF009CDA)
                    : const Color(0xFF9AE2FF),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: isHoveredBtnRegister
                        ? const Color(0xFF009CDA)
                        : const Color(0xFF74D7FF),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    fontFamily: 'Noir',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
