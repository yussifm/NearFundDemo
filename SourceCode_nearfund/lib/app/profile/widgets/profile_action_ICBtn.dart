import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileActionWidget extends StatelessWidget {
  ProfileActionWidget({Key? key, required this.icon, required this.ontap})
      : super(key: key);

  final IconData icon;
  Function ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.black.withOpacity(0.1)),
      child: Center(
        child: IconButton(
            onPressed: () {
              ontap();
            },
            icon: FaIcon(
              icon,
              size: 20,
            )),
      ),
    );
  }
}
