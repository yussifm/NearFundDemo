import 'package:flutter/material.dart';

class StudentFeed extends StatefulWidget {
  StudentFeed({Key? key}) : super(key: key);

  @override
  State<StudentFeed> createState() => _StudentFeedState();
}

class _StudentFeedState extends State<StudentFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Student'),
    );
  }
}
