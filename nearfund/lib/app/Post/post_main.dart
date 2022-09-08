import 'package:flutter/material.dart';

class MainPostPage extends StatefulWidget {
  MainPostPage({Key? key}) : super(key: key);

  @override
  State<MainPostPage> createState() => _MainPostPageState();
}

class _MainPostPageState extends State<MainPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('mainPost page'),
    );
  }
}
