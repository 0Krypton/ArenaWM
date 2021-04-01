//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing themes
import '../../../../../Themes/text.dart';

//importing widgets
import 'Inbox/inbox.dart';

Widget appBar({
  required BuildContext context,
  required double width,
}) {
  return Container(
    height: 50,
    width: width,
    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        reglo(
          text: 'Home',
          fontSize: 20,
          color: Colors.black,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              Inbox.comeToPage(),
            );
          },
          child: SvgPicture.asset(
            'assets/chat.svg',
            color: Colors.black,
            height: 25,
            width: 25,
          ),
        ),
      ],
    ),
  );
}
