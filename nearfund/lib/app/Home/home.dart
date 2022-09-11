import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/app/Home/home_feed.dart';
import 'package:nearfund/app/Student/StudentFeed.dart';
import 'package:nearfund/app/contentCreators/creators_feed.dart';
import 'package:nearfund/app/others/others_feed.dart';

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
    TabController tabcontroller = TabController(length: 4, vsync: this);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'NearFund',
            style: TextStyle(
              fontSize: 20,
              fontFamily: GoogleFonts.pacifico().fontFamily,
            ),
          ),
          elevation: 0,
          actions: [
            Container(
              child: IconButton(
                icon: Icon(Icons.search_rounded),
                onPressed: () {},
              ),
            )
          ],
          backgroundColor: Colors.white,
          bottom: TabBar(
            controller: tabcontroller,
            isScrollable: true,
            indicator: const BubbleTabIndicator(
                indicatorHeight: 25.0,
                indicatorColor: Colors.amberAccent,
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                indicatorRadius: 15,
                insets: EdgeInsets.all(1),
                padding: EdgeInsets.all(10)),
            unselectedLabelColor: Colors.grey,
            onTap: (value) {},
            tabs: const [
              Tab(
                text: 'Feed',
              ),
              Tab(text: 'Creators'),
              Tab(
                text: 'Student',
              ),
              Tab(
                text: 'Others',
              )
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(controller: tabcontroller, children: [
            HomeFeed(),
            CreatorsFeed(),
            StudentFeed(),
            OthersFeed()
          ]),
        ));
  }
}
