import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nearfund/app/Auth/Register_page.dart';
import 'package:nearfund/app/Auth/login_page.dart';
import 'package:nearfund/app/Auth/widgets/auth_btn.dart';
import 'package:nearfund/app/Auth/widgets/div_or.dart';
import 'package:nearfund/app/Auth/widgets/social_media_btn.dart';
import 'package:nearfund/theme/colors.dart';
import 'package:nearfund/widgets/customclip.dart';

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
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: Colors.amber[500],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(3.0, 4.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.5,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.5,
                ),
              ],
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [Colors.yellow.shade700, Colors.yellow.shade600],
              // ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 20.0,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('NearFund',
                        textStyle: TextStyle(
                            fontFamily: GoogleFonts.pacifico().fontFamily,
                            fontSize: 25,
                            color: Colors.black)),
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          AuthBtn(
            btnName: "Register",
            onPress: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => RegistPage())));
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const AuthDivider(),
          SocialMediaBtn(
            btnName: "Continue with Google",
            btnIcon: FontAwesomeIcons.google,
            onTapFunc: () {},
            iconColor: Colors.black,
          ),
          SocialMediaBtn(
            btnName: 'Continue with FaceBook',
            btnIcon: FontAwesomeIcons.facebook,
            onTapFunc: () {},
            iconColor: Colors.blue,
          ),
          const SizedBox(height: 30),
          Center(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                bottom: 10,
                left: 30,
                right: 10,
              ),
              child: Row(
                children: [
                  const Text('Already have an account?'),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => LogInPage())));
                    },
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
            ),
          )
        ],
      )),
    );
  }
}
