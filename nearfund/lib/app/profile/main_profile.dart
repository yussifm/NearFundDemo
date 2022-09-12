import 'package:flutter/material.dart';
import 'package:nearfund/app/profile/my_page.dart';

class MainProfilePage extends StatefulWidget {
  MainProfilePage({Key? key}) : super(key: key);

  @override
  State<MainProfilePage> createState() => _MainProfilePageState();
}

class _MainProfilePageState extends State<MainProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Profile image and username / nav to mypage
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyPageProfile()));
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height / 9,

                      // image and text
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //image
                          Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(right: 10, top: 15),
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.deepPurple[50]),
                              child: const Image(
                                image: AssetImage(
                                  'assets/images/NearFund_Logo.png',
                                ),
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              )),

                          //Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("The Coded"),
                              Text(
                                'View my profile',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                // settings icon
                Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings_rounded)),
                )
              ],
            ),
          ),

          //OverView

          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 60,
                    margin: const EdgeInsets.only(top: 50, left: 15, right: 15),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        ProfileStatsWidget(
                          name: 'POST',
                          number: '0',
                        ),
                        ProfileStatsWidget(
                          name: 'Support',
                          number: '0',
                        )
                      ],
                    ),
                  ),

                  //Divider

                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 20, right: 20, bottom: 5),
                    child: Divider(
                      height: 2,
                      thickness: 2,
                      color: Colors.deepPurple[200],
                    ),
                  ),

                  //Earnings and withdraw Section

                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      children: [
                        const Expanded(child: Text('My Earnings(GHS)')),
                        const Expanded(
                          child: const Text('10000.00'),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              radius: 1,
                              onTap: () {},
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 100,
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.deepPurple[200]),
                                child: Text(
                                  'Withdraw',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[600]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //Recent Support
                  Expanded(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Recent Donations',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[400]),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: ListView(
                              children: [],
                            ))
                      ],
                    ),
                  ))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class ProfileStatsWidget extends StatelessWidget {
  const ProfileStatsWidget({Key? key, required this.name, required this.number})
      : super(key: key);

  final String number;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Text(number,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 15))),
      Expanded(
        child: Text(
          name.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
      )
    ]);
  }
}
