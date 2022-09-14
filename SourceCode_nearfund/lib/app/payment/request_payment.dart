import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/app/Auth/widgets/auth_btn.dart';

import '../../widgets/general_textfiled.dart';
import 'widget/text_caption.dart';

class RequestToPayment extends ConsumerStatefulWidget {
  RequestToPayment({Key? key}) : super(key: key);

  @override
  ConsumerState<RequestToPayment> createState() => _RequestPaymentState();
}

class _RequestPaymentState extends ConsumerState<RequestToPayment> {
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
        elevation: 0,
        title: const Text("Payment"),
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
                        Text('Funding: '),
                        Text(
                          'The Coded',
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
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),

          // Button
          AuthBtn(
            btnName: 'Request',
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
