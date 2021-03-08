//importing pacakges
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//importing themes
import '../../../Themes/color.dart';

//importing widgets
import '../../CustomTextField.dart';

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
  late AnimationController passwordRegisterColorController;
  late AnimationController userNameRegisterColorController;

  late FocusNode emailRegisterFocusNode;
  late FocusNode passwordRegisterFocusNode;
  late FocusNode userNameRegisterFocusNode;

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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            labelText: 'Email',
            type: 'email',
            focusNode: emailRegisterFocusNode,
            nextFocusNode: passwordRegisterFocusNode,
            colorAnimController: emailRegisterColorController,
            prefixIconUrl: 'assets/form/emailPng.png',
            onChanged: (email) {
              print('Email : $email');
            },
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 50,
          child: CustomTextField(
            labelText: 'User Name',
            type: 'username',
            focusNode: userNameRegisterFocusNode,
            nextFocusNode: passwordRegisterFocusNode,
            prefixIconUrl: 'assets/form/userPng.png',
            colorAnimController: userNameRegisterColorController,
            limit: 4,
            onChanged: (userName) {
              print('Username : $userName');
            },
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 50,
          child: CustomTextField(
            labelText: 'Password',
            type: 'password',
            focusNode: passwordRegisterFocusNode,
            nextFocusNode: passwordRegisterFocusNode,
            prefixIconUrl: 'assets/form/securePng.png',
            colorAnimController: passwordRegisterColorController,
            isObscure: _isVisibleRegister,
            isPasswordField: true,
            onChanged: (password) {
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
            print('Clicked');
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
    );
  }
}
