import 'package:flutter/material.dart';
import 'package:nearfund/theme/config.dart';
import 'package:nearfund/theme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme, //3
      darkTheme: CustomTheme.darkTheme, //4
      themeMode: currentTheme.currentTheme,
      home: ,
    );
  }
}

