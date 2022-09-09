import 'package:flutter/material.dart';

import '../Post/widget/post_card.dart';

class HomeFeed extends StatefulWidget {
  HomeFeed({Key? key}) : super(key: key);

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.3),
        body: ListView.builder(
            itemCount: 120,
            itemBuilder: (context, index) {
              return PostCard();
            }));
  }
}