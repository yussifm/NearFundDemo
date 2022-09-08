import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List TabNavPages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  child: Text(
                'Discover',
                style: TextStyle(),
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                child: TabBar(
                  tabs: [
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
              Container(
                child: TabBarView(children: TabNavPages[0]),
              )
            ],
          ),
        ));
  }
}
