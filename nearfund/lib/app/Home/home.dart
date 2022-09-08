import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/app/Home/home_feed.dart';
import 'package:nearfund/app/Student/StudentFeed.dart';
import 'package:nearfund/app/contentCreators/creators_feed.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  int currentTapPage = 0;

  void ontap(val) {
    setState(() {
      currentTapPage = val;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabcontroller = TabController(length: 3, vsync: this);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'NearFund',
            style: TextStyle(
              fontFamily: GoogleFonts.pacifico().fontFamily,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            controller: tabcontroller,
            isScrollable: true,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.amber,
              ),
              insets: EdgeInsets.symmetric(horizontal: 20.0),
            ),
            unselectedLabelColor: Colors.grey,
            onTap: (value) {},
            tabs: const [
              Tab(
                text: 'Feed',
              ),
              Tab(text: 'Creators'),
              Tab(
                text: 'Student',
              )
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
              controller: tabcontroller,
              children: [HomeFeed(), CreatorsFeed(), StudentFeed()]),
        ));
  }
}
