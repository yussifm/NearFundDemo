import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:nearfund/Utils/form_validator.dart';
import 'package:nearfund/app/Auth/login_page.dart';
import 'package:nearfund/app/Auth/widgets/auth_btn.dart';
import 'package:nearfund/app/Auth/widgets/auth_textfield.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../services/authService.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  late TextEditingController _email_controller;
  bool isloading = false;
  String errormessage = "";

  @override
  void initState() {
    _email_controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final autState = ref.watch(authServiceProvide);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Please Enter your Email below"),
          TextFelidFormWidget(
            controller: _email_controller,
            hint_text: "Email",
            label_text: "Email",
            postIcon: Icons.email_rounded,
            validator: (val) {
              if (!val!.isValidEmail) {
                return 'Enter valid email';
              }
              return null;
            },
          ),
          AuthBtn(
            btnName: "Send Reset Link",
            width: 200,
            onPress: () async {
              setState(() {
                isloading = true;
              });

              if (_email_controller.text.isValidEmail) {
                try {
                  await autState
                      .paasswordRest(email: _email_controller.text)
                      .then(
                        (value) => Alert(
                          context: context,
                          title: "Forget Password",
                          buttons: [
                            DialogButton(
                                child: const Text(
                                  "Close",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LogInPage()));
                                })
                          ],
                          desc:
                              "Password Reset Email link sent, check your mail box",
                        ).show(),
                      );
                  setState(() {
                    isloading = false;
                  });
                } catch (e) {
                  setState(() {
                    isloading = false;
                    errormessage = e.toString();
                  });
                }
              } else {
                setState(() {
                  isloading = false;
                });
              }
            },
            isloading: isloading,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            errormessage,
            style: const TextStyle(fontSize: 20, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
