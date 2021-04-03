//importing pacakges
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing themes
import '../../../../../../Themes/color.dart';

class SearchField extends StatefulWidget {
  SearchField({
    required this.heightField,
    required this.controller,
    required this.focusNode,
    required this.hint,
    required this.callBack,
    this.colorAnimController,
    this.prefixIconUrl,
    this.suffixIconUrl,
  });

  final double heightField;
  final FocusNode focusNode;
  final TextEditingController controller;

  final AnimationController? colorAnimController;

  final String hint;
  final String? prefixIconUrl;
  final String? suffixIconUrl;

  final Function(String value) callBack;

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late Animation<Color?> textFieldFilledColor;
  late Animation<Color?> textFieldTextColor;

  @override
  void initState() {
    super.initState();

    if (widget.colorAnimController != null) {
      textFieldFilledColor = ColorTween(
        begin: txtFieldBgColor,
        end: Colors.red[100],
      ).animate(widget.colorAnimController!)
        ..addListener(() {
          setState(() {});
        });
      textFieldTextColor = ColorTween(
        begin: txtFieldHintColor,
        end: Colors.red[900],
      ).animate(widget.colorAnimController!)
        ..addListener(() {
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heightField,
      child: TextField(
        controller: widget.controller,
        autofocus: false,
        maxLines: 1,
        minLines: 1,
        textAlign: TextAlign.center,
        cursorColor: widget.colorAnimController == null
            ? Colors.black
            : textFieldTextColor.value,
        focusNode: widget.focusNode,
        style: TextStyle(
          fontFamily: 'Reglo',
          fontSize: 15,
          color: widget.colorAnimController == null
              ? Colors.black
              : textFieldTextColor.value,
        ),
        onChanged: (v) {
          widget.callBack(v);
        },
        decoration: InputDecoration(
          hoverColor: widget.colorAnimController == null
              ? const Color(0xFFF7F7F7)
              : textFieldTextColor.value,
          counterText: '',
          border: InputBorder.none,
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: widget.colorAnimController == null
                ? txtFieldHintColor
                : textFieldTextColor.value,
            fontSize: 12,
            fontFamily: 'Gilroy',
            letterSpacing: 1.2,
          ),
          filled: true,
          fillColor: widget.colorAnimController == null
              ? txtFieldBgColor
              : textFieldFilledColor.value,
          prefixIcon: widget.prefixIconUrl != null
              ? Container(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    widget.prefixIconUrl!,
                    color: widget.colorAnimController == null
                        ? txtFieldHintColor
                        : textFieldTextColor.value,
                    fit: BoxFit.cover,
                  ),
                )
              : null,
          suffixIcon: widget.suffixIconUrl != null
              ? Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    widget.suffixIconUrl!,
                    color: widget.colorAnimController == null
                        ? txtFieldHintColor
                        : textFieldTextColor.value,
                    fit: BoxFit.cover,
                  ),
                )
              : null,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(const Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(const Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
