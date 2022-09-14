import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/app/Auth/widgets/auth_btn.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uuid/uuid.dart';

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
  var uuid = Uuid();
  static const kuserID = '';
  late String kuuid;
  static const ksubscriptionKey = '02fd569a483a47788fce22a00fb44101';

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
    kuuid = uuid.v4();
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
            onPress: () {
              requestMTN(_amount_controller.text);
            },
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

  requestMTN(String amount) async {
    print(amount);
    var ref = await createuser();
    var apikey = await getUserAPIKey(ref);
    var Token = await getToken(ref, apikey);
    var request = await requestToPay(Token, ref, amount);
  }

  requestToPay(String token, String ref, String amount) async {
    var headers = {
      'X-Reference-Id': '$ref',
      'X-Target-Environment': 'sandbox',
      'Ocp-Apim-Subscription-Key': '02fd569a483a47788fce22a00fb44101',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://sandbox.momodeveloper.mtn.com/collection/v1_0/requesttopay'));
    request.body = json.encode({
      "amount": "$amount",
      "currency": "EUR",
      "externalId": "$ref",
      "payer": {"partyIdType": "msisdn", "partyId": "46733123454"},
      "payerMessage": "Test payment 2",
      "payeeNote": "Test payment 2"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 202) {
      print(await response.stream.bytesToString());
      Alert(
        context: context,
        type: AlertType.success,
        title: "Success",
        desc: "You have approved GHS $amount via MTM MoMo",
        buttons: [
          DialogButton(
            child: Text(
              "Okay",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    } else {
      print(response.reasonPhrase);
    }
  }

  getToken(String userid, String userkey) async {
    String key = base64Encode(utf8.encode('$userid:$userkey'));
    var headers = {
      'Ocp-Apim-Subscription-Key': '$ksubscriptionKey',
      'Authorization': 'Basic $key'
    };
    /*var request = http.Request('POST',
        Uri.parse('https://sandbox.momodeveloper.mtn.com/collection/token/'));*/

    var url =
        Uri.parse('https://sandbox.momodeveloper.mtn.com/collection/token/');
    var response = await http.post(url, headers: headers);
    //request.headers.addAll(headers);

    // var response = await request.send();

    if (response.statusCode == 200) {
      print(response.body);
      var data2 = jsonDecode(await response.body);
      print(data2['access_token']);
      return data2['access_token'];
    } else {
      print(response.reasonPhrase);
    }
  }

  getUserAPIKey(String key) async {
    var headers = {'Ocp-Apim-Subscription-Key': '$ksubscriptionKey'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://sandbox.momodeveloper.mtn.com/v1_0/apiuser/$key/apikey'));
    request.body = '';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      var data = jsonDecode(await response.stream.bytesToString());
      print(data['apiKey']);
      return data['apiKey'];
    } else {
      print(response.reasonPhrase);
    }
  }

  getuid() {
    return uuid.v4();
  }

  createuser() async {
    var headers = {
      'Content-Type': 'application/json',
      'Ocp-Apim-Subscription-Key': '$ksubscriptionKey',
      'X-Reference-Id': '$kuuid'
    };
    var request = http.Request('POST',
        Uri.parse('https://sandbox.momodeveloper.mtn.com/v1_0/apiuser'));
    request.body = json.encode(
        {"providerCallbackHost": "callbacks-do-not-work-in-sandbox.com"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      print('${await response.stream.bytesToString()} $kuuid');
      print(kuuid);
      return kuuid;
    } else {
      print(response.reasonPhrase);
    }
  }
}
