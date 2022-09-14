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
        backgroundColor: Colors.grey.withOpacity(0.2),
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return PostCard();
            }));
  }
}
