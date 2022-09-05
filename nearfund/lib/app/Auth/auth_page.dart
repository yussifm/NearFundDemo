import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nearfund/app/Auth/widgets/auth_btn.dart';
import 'package:nearfund/app/Auth/widgets/div_or.dart';
import 'package:nearfund/app/Auth/widgets/social_media_btn.dart';
import 'package:nearfund/theme/colors.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.slitWhite,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 20.0,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('HI, Welcome',
                        textStyle: TextStyle(
                            fontFamily: GoogleFonts.pacifico().fontFamily)),
                    WavyAnimatedText('NearFund',
                        textStyle: TextStyle(
                            fontFamily: GoogleFonts.pacifico().fontFamily,
                            fontSize: 30)),
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AuthBtn(
              btnName: "Register",
              onPress: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            const AuthDivider(),
            SocialMediaBtn(
              btnName: "Register with Google",
              btnIcon: FontAwesomeIcons.google,
              onTapFunc: () {},
              iconColor: Colors.black,
            ),
            SocialMediaBtn(
              btnName: 'Register with FaceBook',
              btnIcon: FontAwesomeIcons.facebook,
              onTapFunc: () {},
              iconColor: Colors.lightBlueAccent,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              height: 50,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                children: [
                  const Text('Already have an account:?'),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.brown),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
