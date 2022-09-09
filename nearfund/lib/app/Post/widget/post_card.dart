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
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(child: Text('sep 16, 2022')),
                const Expanded(child: Text('title')),
                const Expanded(child: Text('desc')),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: const [
                          FaIcon(FontAwesomeIcons.heart),
                          Text(
                            '10000000',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )),
                      const Expanded(child: FaIcon(FontAwesomeIcons.message)),
                      const Expanded(
                          child: const FaIcon(FontAwesomeIcons.share))
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
