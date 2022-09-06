import 'package:flutter/material.dart';
import 'package:nearfund/theme/colors.dart';

class AuthBtn extends StatelessWidget {
  const AuthBtn({
    Key? key,
    required this.btnName,
    required this.onPress,
    this.isloading = false,
    this.elevat = 0.0,
    this.hight = 50,
    this.width = 50,
    this.radius = 30,
  }) : super(key: key);
  final String btnName;
  final Function onPress;
  final bool isloading;
  final double elevat;
  final double width;
  final double hight;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      borderRadius: BorderRadius.circular(30),
      splashColor: Colors.amber,
      child: Container(
        width: width,
        height: hight,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius), color: Colors.yellow),
        child: isloading
            ? const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.brown,
              )
            : Text(
                btnName,
                style: const TextStyle(
                    color: Colors.black87,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600),
              ),
      ),
    );
  }
}
