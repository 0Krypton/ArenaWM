//importing packages
import 'package:flutter/material.dart';

//importing themes
import '../Themes/color.dart';

class ArenaLogo extends StatelessWidget {
  const ArenaLogo();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Arena LogoTapped');
      },
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Text(
        'A',
        style: TextStyle(
          color: arenaLogoColor,
          fontSize: 30,
          fontFamily: 'Noir',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
