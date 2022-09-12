import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/app/Auth/auth_page.dart';

import '../../services/authService.dart';

class SettingPage extends ConsumerStatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final autState = ref.watch(authServiceProvide);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("settings".toUpperCase()),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const FaIcon(FontAwesomeIcons.xmark),
                ),
              ],
            ),
            const Divider(
              thickness: 0.7,
            ),
            const SizedBox(
              height: 20,
            ),
            ActionsWidget(
              icon: FontAwesomeIcons.bell,
              text: 'Notification',
              onTapFunc: () {},
            ),
            ActionsWidget(
              icon: Icons.help_outline_rounded,
              text: 'Help Center',
              iconsize: 25,
              onTapFunc: () {},
            ),
            ActionsWidget(
              icon: FontAwesomeIcons.arrowRightFromBracket,
              text: 'Logout',
              onTapFunc: () async {
                await autState
                    .signOut()
                    .then((value) => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: ((context) => AuthPage()))))
                    .onError((error, stackTrace) => error.toString());
              },
            ),
          ],
        ),
      )),
    );
  }
}

class ActionsWidget extends StatelessWidget {
  ActionsWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onTapFunc,
      this.iconsize = 20})
      : super(key: key);

  final String text;
  final IconData icon;
  Function onTapFunc;
  double iconsize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFunc();
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        child: Row(
          children: [
            FaIcon(
              icon,
              size: iconsize,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Text(text),
            )
          ],
        ),
      ),
    );
  }
}
