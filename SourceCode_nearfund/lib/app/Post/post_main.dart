import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nearfund/app/Post/all_post.dart';
import 'package:nearfund/app/Post/create_post_page.dart';
import 'package:nearfund/app/Post/draft_page.dart';

class MainPostPage extends StatefulWidget {
  MainPostPage({Key? key}) : super(key: key);

  @override
  State<MainPostPage> createState() => _MainPostPageState();
}

class _MainPostPageState extends State<MainPostPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabcontroller = TabController(length: 2, vsync: this);
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        // Title
        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
              ),
              child: Text(
                'my post'.toUpperCase(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),

        // Create Post Button
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => CreatePostPage())));
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.3)),
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Column(
                children: const [
                  Expanded(
                    child: Icon(
                      FontAwesomeIcons.fileLines,
                      size: 50,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    'Create Post',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),

        //  Tabs
        Expanded(
            child: TabBar(
                onTap: (value) {},
                indicatorWeight: 1,
                indicatorPadding: const EdgeInsets.only(top: 5),
                controller: tabcontroller,
                indicatorColor: Colors.amber,
                tabs: const [
              Tab(
                text: 'All Post',
              ),
              Tab(text: 'Drafts'),
            ])),
        Expanded(
            flex: 5,
            child: TabBarView(
                controller: tabcontroller,
                children: [AllUserPost(), UserDaftPost()]))
      ]),
    ));
  }
}
