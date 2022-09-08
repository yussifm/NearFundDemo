import 'package:flutter/material.dart';

class MainProfilePage extends StatefulWidget {
  MainProfilePage({Key? key}) : super(key: key);

  @override
  State<MainProfilePage> createState() => _MainProfilePageState();
}

class _MainProfilePageState extends State<MainProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('profile'),
    );
  }
}
