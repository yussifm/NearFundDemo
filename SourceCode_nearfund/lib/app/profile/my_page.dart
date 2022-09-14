import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../payment/request_payment.dart';
import 'widgets/profile_action_ICBtn.dart';
import 'widgets/profile_statsWidget.dart';

class MyPageProfile extends StatefulWidget {
  MyPageProfile({Key? key}) : super(key: key);

  @override
  State<MyPageProfile> createState() => _MyPageProfileState();
}

class _MyPageProfileState extends State<MyPageProfile> {
  bool isUser = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Top Icons
              Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProfileActionWidget(
                          icon: FontAwesomeIcons.chevronLeft,
                          ontap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ProfileActionWidget(
                          icon: FontAwesomeIcons.arrowUpFromBracket,
                          ontap: () {},
                        ),
                      ],
                    ),
                  )),

              Expanded(
                  flex: 6,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        top: 80,
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 50, left: 15, right: 15),
                          height: MediaQuery.of(context).size.height / 2,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // UserName / Title
                                const Text(
                                  'The Coded',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),

                                //Description
                                const Expanded(
                                  child: Text(
                                    'Am a content creator and a student, I create videos tutorials on programming and game development , Please consider supporting me ',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 60,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.withOpacity(0.4)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Expanded(
                                        child: ProfileStatsWidget(
                                          name: 'POST',
                                          number: '0',
                                        ),
                                      ),
                                      const Expanded(
                                        child: ProfileStatsWidget(
                                          name: 'Support',
                                          number: '0',
                                        ),
                                      ),
                                      Visibility(
                                        visible: !isUser,
                                        child: Expanded(
                                            child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        RequestToPayment())));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: double.maxFinite,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.deepPurple[200],
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Text(
                                              'Support'.toUpperCase(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Positioned(
                        top: 2,
                        left: 50,
                        right: 50,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: const Offset(3.0, 4.0),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.1,
                                ),
                              ],
                            ),
                            child: const Image(
                              image: AssetImage(
                                'assets/images/NearFund_Logo.png',
                              ),
                              width: 100,
                              height: 100,
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.high,
                            )),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
