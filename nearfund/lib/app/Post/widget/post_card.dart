import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCard extends StatefulWidget {
  PostCard({Key? key}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(children: [
        Text('sep 16, 2022'),
        Text('title'),
        Text('desc'),
        Row(
          children: [
            FaIcon(FontAwesomeIcons.heart),
            Text('10000000'),
            FaIcon(FontAwesomeIcons.message),
            FaIcon(FontAwesomeIcons.share)
          ],
        )
      ]),
    );
  }
}
