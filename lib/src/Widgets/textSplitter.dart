//importing packager
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget textSplitter({required String input}) {
  List<TextSpan> textSpans = [];

  for (var i = 0; i <= '@'.allMatches(input).length; i++) {
    String part = input.substring(
      0,
      input.indexOf('@') == -1 ? input.length : input.indexOf('@'),
    );
    textSpans.add(
      TextSpan(
        text: part,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontFamily: 'Gilroy',
        ),
      ),
    );

    input = input.substring(input.indexOf('@'));
    String clickable = input.substring(
        0, input.indexOf(' ') == -1 ? input.length : input.indexOf(' '));
    textSpans.add(
      TextSpan(
        text: clickable,
        style: TextStyle(
          color: const Color(0xFF3C86F1),
          fontSize: 12,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.bold,
        ),
        recognizer: new TapGestureRecognizer()
          ..onTap = () {
            //do stuff here with string clickable
            print(clickable);
          },
      ),
    );
    input = input.substring(
      input.indexOf(' ') == -1 ? input.length : input.indexOf(' '),
    );
  }

  return RichText(
    text: TextSpan(
      children: textSpans,
    ),
    textAlign: TextAlign.center,
  );
}
