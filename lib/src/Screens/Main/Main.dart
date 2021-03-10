//importing packages
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

//importing screens
import './App.dart';
import '../Auth/AuthScr.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VRouter(
      title: 'Arena',
      mode: VRouterModes.history,
      routes: [
        VStacked(
          path: '/',
          widget: App(),
        ),
        VStacked(path: '/login', widget: AuthScreen(title: 'LOGIN')),
        VStacked(path: '/register', widget: AuthScreen(title: 'REGISTER')),
      ],
    );
  }
}
