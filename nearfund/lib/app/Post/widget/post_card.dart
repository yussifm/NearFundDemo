import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostCard extends ConsumerStatefulWidget {
  PostCard({Key? key}) : super(key: key);

  @override
  ConsumerState<PostCard> createState() => _PostCardState();
}

class _PostCardState extends ConsumerState<PostCard> {
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(
                    child: Text(
                  'title',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
                const Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image(
                          image: AssetImage('assets/images/paid_idea_1.png'),
                          width: double.maxFinite,
                          height: 40,
                          fit: BoxFit.contain,
                        ))),
                const Expanded(
                    child: Text(
                  'sep 16, 2022',
                  style: TextStyle(fontSize: 10),
                )),
                const Expanded(
                    child: Text(
                  'Am a content creator and a student, I create videos tutorials on programming and game development , Please consider supporting me',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                )),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: 20,
                            color: Colors.redAccent,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              '10000000',
                              style: TextStyle(fontSize: 6, color: Colors.red),
                            ),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.comment,
                            size: 20,
                            color: Colors.greenAccent,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              '10000000',
                              style: TextStyle(fontSize: 6, color: Colors.red),
                            ),
                          ),
                        ],
                      )),
                      const Expanded(
                          child: FaIcon(
                        FontAwesomeIcons.arrowUpFromBracket,
                        size: 20,
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            'Support'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ))
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
