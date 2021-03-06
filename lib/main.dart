//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing Widgets
import './src/Screens/Main/Main.dart';

void main() {
  runApp(ProviderScope(child: Main()));
}
