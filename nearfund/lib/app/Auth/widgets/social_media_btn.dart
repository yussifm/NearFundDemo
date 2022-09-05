import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nearfund/theme/colors.dart';

class SocialMediaBtn extends StatelessWidget {
  SocialMediaBtn(
      {Key? key,
      required this.btnName,
      required this.btnIcon,
      required this.onTapFunc,
      required this.iconColor})
      : super(key: key);

  final String btnName;
  final IconData btnIcon;
  Function onTapFunc;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTapFunc();
        },
        borderRadius: BorderRadius.circular(20),
        splashColor: CustomColors.yellowBrown,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: Colors.black.withOpacity(0.2), width: 1.5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: FaIcon(
                  btnIcon,
                  color: iconColor,
                  size: 30,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  btnName,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ));
  }
}
