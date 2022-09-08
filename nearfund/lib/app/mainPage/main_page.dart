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
        backgroundColor: Colors.white,
        bottomNavigationBar: FloatingNavbar(
          backgroundColor: Colors.grey,
          selectedBackgroundColor: Colors.amber[200],
          currentIndex: currentBottNavpostition,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.white.withOpacity(0.8),
          iconSize: 30,
          borderRadius: 20,
          itemBorderRadius: 20,
          fontSize: 10,
          margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
          padding: const EdgeInsets.all(10),
          items: [
            FloatingNavbarItem(icon: Icons.dashboard_rounded, title: 'Home'),
            FloatingNavbarItem(icon: Icons.add_box_rounded, title: 'Post'),
            FloatingNavbarItem(icon: Icons.person, title: 'My Page'),
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
