import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nearfund/app/Home/home.dart';
import 'package:nearfund/app/Post/post_main.dart';
import 'package:nearfund/app/profile/main_profile.dart';

class MainAppPage extends StatefulWidget {
  MainAppPage({Key? key}) : super(key: key);

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  List bottomNavPages = [HomePage(), MainPostPage(), MainProfilePage()];
  int currentBottNavpostition = 0;

  void onTapBnav({required int index}) {
    setState(() {
      currentBottNavpostition = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: FloatingNavbar(
          backgroundColor: Colors.white60,
          currentIndex: currentBottNavpostition,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          elevation: 10,
          items: [
            FloatingNavbarItem(icon: FontAwesomeIcons.house, title: 'Home'),
            FloatingNavbarItem(icon: FontAwesomeIcons.house, title: 'Post'),
            FloatingNavbarItem(icon: FontAwesomeIcons.house, title: 'My Page'),
          ],
          onTap: (int val) {
            onTapBnav(index: val);
          },
        ),
        body: SafeArea(
          child: bottomNavPages[currentBottNavpostition],
        ));
  }
}
