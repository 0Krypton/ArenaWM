//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing themes
import '../../../../../../Themes/text.dart';

Widget appBar({required BuildContext context, required double width}) {
  return Container(
    height: 50,
    width: width,
    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SvgPicture.asset(
            'assets/back.svg',
            height: 25,
            width: 25,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 15),
        reglo(
          text: 'Inbox',
          fontSize: 20,
          color: Colors.black,
        ),
      ],
    ),
  );
}
