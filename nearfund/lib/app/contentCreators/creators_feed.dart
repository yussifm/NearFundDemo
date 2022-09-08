import 'package:flutter/material.dart';

class CreatorsFeed extends StatefulWidget {
  CreatorsFeed({Key? key}) : super(key: key);

  @override
  State<CreatorsFeed> createState() => _CreatorsFeedState();
}

class _CreatorsFeedState extends State<CreatorsFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Creators'),
    );
  }
}
