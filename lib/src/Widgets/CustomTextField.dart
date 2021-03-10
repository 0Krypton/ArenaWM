// importing packages
import 'package:flutter/material.dart';

//importing utils
import '../utils/validators.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.controller,
    this.isExpands = false,
    this.type,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.limit,
    this.labelText = '',
    this.hintText = '',
    this.prefixIconUrl,
    this.isObscure = false,
    this.isPasswordField = false,
    required this.focusNode,
    required this.nextFocusNode,
    this.suffixOnPressed,
    required this.onSubmit,
    required this.onChange,
    required this.colorAnimController,
  });

  final int maxLines;
  final int minLines;
  final int? maxLength;
  final int? limit;

  final String? type;

  final String labelText;
  final String hintText;
  final String? prefixIconUrl;

  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  final bool isObscure;
  final bool isPasswordField;
  final bool isExpands;

  final TextEditingController? controller;

  final AnimationController colorAnimController;

  final Function()? suffixOnPressed;
  final Function(String value) onSubmit;
  final Function(String value) onChange;

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

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      expands: widget.isExpands,
      autofocus: false,
      maxLines: widget.isExpands == true ? null : widget.maxLines,
      minLines: widget.isExpands == true ? null : widget.minLines,
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
          if (v.trim().validateEmail) {
            widget.colorAnimController.reverse();
            widget.onChange(v.trim());
          } else {
            widget.colorAnimController.forward();
          }
        } else if (widget.type == 'password') {
          if (v.trim().validatePassword) {
            widget.colorAnimController.reverse();
            widget.onChange(v.trim());
          } else {
            widget.colorAnimController.forward();
          }
        } else if (widget.type == 'username') {
          if (v.trim().validateUserName) {
            widget.colorAnimController.reverse();
            widget.onChange(v.trim());
          } else {
            widget.colorAnimController.forward();
          }
        } else {
          if (v.trim().length >= (widget.limit ?? 0)) {
            widget.colorAnimController.reverse();
            widget.onChange(v.trim());
          } else {
            widget.colorAnimController.forward();
          }
        }
      },
      onSubmitted: (value) {
        widget.focusNode.unfocus();
        if (widget.type == 'email') {
          if (value.trim().validateEmail) {
            widget.onSubmit(value);
            widget.focusNode.unfocus();
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
            return;
          }
        } else if (widget.type == 'password') {
          if (value.trim().validatePassword) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
            widget.focusNode.unfocus();
            widget.onSubmit(value);
            return;
          }
        } else if (widget.type == 'username') {
          if (value.trim().validateUserName) {
            widget.focusNode.unfocus();
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
            widget.onSubmit(value);
            return;
          }
        } else if (value.length >= (widget.limit ?? 0)) {
          widget.focusNode.unfocus();
          FocusScope.of(context).requestFocus(widget.nextFocusNode);
          widget.onSubmit(value);
          return;
        }
        //TODO
        //show global error
        FocusScope.of(context).requestFocus(widget.focusNode);
      },
      decoration: InputDecoration(
        hoverColor: const Color(0xFFC1F4FF),
        counterText: '',
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: textFieldTextColor.value,
          fontSize: 12,
          fontFamily: 'Lequire',
        ),
        filled: true,
        fillColor: textFieldFilledColor.value,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: textFieldTextColor.value,
          fontSize: 12,
          fontFamily: 'Lequire',
        ),
        prefixIcon: widget.prefixIconUrl != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Image.asset(
                      widget.prefixIconUrl!,
                      color: textFieldTextColor.value,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              )
            : null,
        suffixIcon: widget.isPasswordField == true
            ? IconButton(
                icon: Icon(
                  widget.isObscure ? Icons.visibility_off : Icons.visibility,
                  color: widget.isObscure
                      ? textFieldTextColor.value
                      : iconUnVisibleColor.value,
                ),
                onPressed: widget.suffixOnPressed,
              )
            : const SizedBox(height: 0, width: 0),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(const Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(const Radius.circular(10)),
        ),
      ),
    );
  }
}
