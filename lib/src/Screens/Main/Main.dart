//importing packages
import 'package:flutter/material.dart';

//importing screens
import './App.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arena',
      home: App(),
    );
  }
}
