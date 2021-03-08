// importing packages
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    this.controller,
    this.type,
    this.maxLines,
    this.maxLength,
    this.limit,
    required this.labelText,
    required this.prefixIconUrl,
    this.isObscure = false,
    this.isPasswordField = false,
    required this.focusNode,
    required this.nextFocusNode,
    this.suffixOnPressed,
    required this.onChanged,
    required this.colorAnimController,
  });

  final int? maxLines;
  final int? maxLength;
  final int? limit;

  final String? type;

  final String labelText;
  final String prefixIconUrl;

  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  final bool isObscure;
  final bool isPasswordField;

  final TextEditingController? controller;

  late final AnimationController colorAnimController;

  final Function()? suffixOnPressed;
  final Function(String value) onChanged;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late Animation<Color?> textFieldFilledColor;
  late Animation<Color?> textFieldTextColor;
  late Animation<Color?> iconUnVisibleColor;

  @override
  void initState() {
    super.initState();

    textFieldFilledColor = ColorTween(
      begin: const Color(0xFFE5FAFF),
      end: Colors.red[100],
    ).animate(widget.colorAnimController)
      ..addListener(() {
        setState(() {});
      });
    textFieldTextColor = ColorTween(
      begin: const Color(0xFF26C3FF),
      end: Colors.red[900],
    ).animate(widget.colorAnimController)
      ..addListener(() {
        setState(() {});
      });
    iconUnVisibleColor = ColorTween(
      begin: const Color(0xFF26C3FF),
      end: Colors.red[600],
    ).animate(widget.colorAnimController)
      ..addListener(() {
        setState(() {});
      });
  }

  bool validateEmail(String value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }

  bool validatePassword(String value) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(value);
  }

  bool validateUserName(String value) {
    return RegExp(
            r'^[a-zA-Z]([._-](?![._-])|[a-zA-Z0-9]){2,20}([a-zA-Z0-9]|[_-])$')
        .hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      maxLength: widget.maxLength,
      textAlign: TextAlign.center,
      obscureText: widget.isObscure,
      cursorColor: textFieldTextColor.value,
      focusNode: widget.focusNode,
      style: TextStyle(
        color: textFieldTextColor.value,
        fontSize: 15,
        fontFamily: 'Reglo',
        letterSpacing: 1,
        wordSpacing: 1,
      ),
      onChanged: (v) {
        if (widget.type == 'email') {
          if (validateEmail(v.trim())) {
            widget.colorAnimController.reverse();
            widget.onChanged(v.trim());
          } else {
            widget.colorAnimController.forward();
            widget.onChanged(v.trim());
          }
        } else if (widget.type == 'password') {
          if (validatePassword(v.trim())) {
            widget.colorAnimController.reverse();
            widget.onChanged(v.trim());
          } else {
            widget.colorAnimController.forward();
            widget.onChanged(v.trim());
          }
        } else if (widget.type == 'username') {
          if (validateUserName(v.trim())) {
            widget.colorAnimController.reverse();
            widget.onChanged(v.trim());
          } else {
            widget.colorAnimController.forward();
            widget.onChanged(v.trim());
          }
        } else {
          if (v.trim().length >= (widget.limit ?? 0)) {
            widget.colorAnimController.reverse();
            widget.onChanged(v.trim());
          } else {
            widget.colorAnimController.forward();
            widget.onChanged(v.trim());
          }
        }
      },
      onSubmitted: (value) {
        widget.focusNode.unfocus();
        if (widget.type == 'email') {
          if (validateEmail(value.trim())) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
        } else if (widget.type == 'password') {
          if (validatePassword(value.trim())) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
        } else if (widget.type == 'username') {
          if (validateUserName(value.trim())) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
        } else {
          if ((value.length >= (widget.limit ?? 0))) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
        }
      },
      decoration: InputDecoration(
        hoverColor: const Color(0xFFC1F4FF),
        counterText: '',
        border: InputBorder.none,
        filled: true,
        fillColor: textFieldFilledColor.value,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: textFieldTextColor.value,
          fontSize: 12,
          fontFamily: 'Lequire',
        ),
        prefixIcon: widget.prefixIconUrl.isNotEmpty
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Image.asset(
                      widget.prefixIconUrl,
                      color: textFieldTextColor.value,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              )
            : null,
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  widget.isObscure ? Icons.visibility_off : Icons.visibility,
                  color: widget.isObscure
                      ? textFieldTextColor.value
                      : iconUnVisibleColor.value,
                ),
                onPressed: widget.suffixOnPressed,
              )
            : SizedBox(
                height: 0,
                width: 0,
              ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
