import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nearfund/app/Auth/widgets/auth_btn.dart';
import 'package:nearfund/widgets/general_textfiled.dart';

import 'widget/text_caption.dart';

class WithdrawEarn extends StatefulWidget {
  WithdrawEarn({Key? key}) : super(key: key);

  @override
  State<WithdrawEarn> createState() => _WithdrawEarnState();
}

class _WithdrawEarnState extends State<WithdrawEarn> {
  late TextEditingController _amount_controller;
  final _userformKey = GlobalKey<FormState>();

  @override
  void initState() {
    _amount_controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _amount_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text("Withdraw"),
        leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.chevronLeft),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _userformKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 30),
                      child: const Text('MTN MOMO')),
                  Container(
                    margin: const EdgeInsets.only(left: 10, bottom: 10),
                    child: Row(
                      children: const [
                        Text('Withdrawing To: '),
                        Text(
                          '0542460098',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  GeneralTextFelidFormWidget(
                    hint_text: 'Amount(GHS)',
                    label_text: 'Amount (GHS)',
                    validator: (val) {
                      if (!val!.isNotEmpty) return 'Enter valid amount';
                      return null;
                    },
                    controller: _amount_controller,
                    borderRadius: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        catptionMethod(text: "Earnings(GHS): 0.00"),
                        catptionMethod(
                            text: "Withdrawable Earnings(GHS): 0.00"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),

          // Button
          AuthBtn(
            btnName: 'Withdraw',
            onPress: () {},
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              height: double.maxFinite,
              padding: const EdgeInsets.only(left: 20),
              color: Colors.grey.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  catptionMethod(
                      text: '* Minimum Amount per Transaction is Ghs 1'),
                  catptionMethod(text: '* Is free, no transaction fees'),
                ],
              )),
        ],
      ),
    );
  }
}
