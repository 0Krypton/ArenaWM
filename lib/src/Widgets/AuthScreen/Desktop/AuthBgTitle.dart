//importing packages
import 'package:flutter/material.dart';

class AuthBgTitle extends StatelessWidget {
  final String title;

  const AuthBgTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          title,
          style: TextStyle(
            color: const Color(0xFF9AE2FF),
            fontFamily: 'Noir',
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
