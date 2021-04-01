//importing pacakges
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing themes
import '../../../../../../Themes/color.dart';

class SearchField extends StatelessWidget {
  SearchField({
    required this.heightField,
    required this.controller,
    required this.focusNode,
    required this.hint,
    required this.callBack,
    this.prefixIconUrl,
    this.suffixIconUrl,
  });

  final double heightField;
  final FocusNode focusNode;
  final TextEditingController controller;

  final String hint;
  final String? prefixIconUrl;
  final String? suffixIconUrl;

  final Function(String value) callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightField,
      child: TextField(
        controller: controller,
        autofocus: false,
        maxLines: 1,
        minLines: 1,
        textAlign: TextAlign.center,
        cursorColor: Colors.black,
        focusNode: focusNode,
        style: TextStyle(
          fontFamily: 'Reglo',
          fontSize: 15,
          color: Colors.black,
        ),
        onChanged: (v) {
          callBack(v);
          print('searchField Value: $v');
        },
        decoration: InputDecoration(
          hoverColor: const Color(0xFFC1F4FF),
          counterText: '',
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: txtFieldHintColor,
            fontSize: 12,
            fontFamily: 'Gilroy',
            letterSpacing: 1.2,
          ),
          filled: true,
          fillColor: txtFieldBgColor,
          prefixIcon: prefixIconUrl != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        prefixIconUrl!,
                        color: txtFieldHintColor,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              : null,
          suffixIcon: suffixIconUrl != null
              ? Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    suffixIconUrl!,
                    color: txtFieldHintColor,
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
