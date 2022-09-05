import 'package:flutter/material.dart';
import 'package:nearfund/theme/colors.dart';

class AuthBtn extends StatelessWidget {
  const AuthBtn(
      {Key? key,
      required this.btnName,
      required this.onPress,
      this.isloading = false,
      this.elevat = 0.0,
      this.btnSize = const Size(70, 50)})
      : super(key: key);
  final String btnName;
  final Function onPress;
  final bool isloading;
  final double elevat;
  final Size btnSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPress();
      },
      style: ElevatedButton.styleFrom(
          primary: CustomColors.yellowBrown,
          onPrimary: Colors.white,
          textStyle: const TextTheme().button,
          elevation: elevat,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          maximumSize: btnSize),
      child: isloading
          ? const CircularProgressIndicator.adaptive(
              backgroundColor: Colors.brown,
            )
          : Text(
              btnName,
              style: const TextTheme().button,
            ),
    );
    ;
  }
}
