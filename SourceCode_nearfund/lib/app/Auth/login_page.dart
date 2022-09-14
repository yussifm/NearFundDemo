import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/Utils/form_validator.dart';
import 'package:nearfund/app/Auth/auth_page.dart';
import 'package:nearfund/app/Auth/forgot_password.dart';
import 'package:nearfund/app/Auth/widgets/auth_btn.dart';
import 'package:nearfund/app/Auth/widgets/auth_textfield.dart';
import 'package:nearfund/app/loading/loading_page.dart';
import 'package:nearfund/app/mainPage/main_page.dart';
import 'package:nearfund/services/authService.dart';

class LogInPage extends ConsumerStatefulWidget {
  LogInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends ConsumerState<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _email_controller;
  late TextEditingController _password_controller;
  bool _loading = false;

  @override
  void initState() {
    _email_controller = TextEditingController();
    _password_controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email_controller.dispose();
    _password_controller.dispose();

    super.dispose();
  }

  bool validationAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  validatedAndSubmit({required WidgetRef ref}) async {
    final autState = ref.watch(authServiceProvide);

    if (validationAndSave()) {
      setState(() {
        _loading = true;
      });
      try {
        await autState
            .signIn(
                email: _email_controller.text,
                password: _password_controller.text)
            .then((value) async {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainAppPage()));
        });

        setState(() {
          _loading = false;
        });
      } catch (e) {
        setState(() {
          _loading = false;

          return;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? LoadingPage()
          : SafeArea(
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => AuthPage())));
                      },
                      icon: const FaIcon(FontAwesomeIcons.chevronLeft),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Welcome Back",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFelidFormWidget(
                            hint_text: "Email",
                            label_text: "Email",
                            postIcon: Icons.email_rounded,
                            validator: (val) {
                              if (!val!.isValidEmail) {
                                return 'Enter valid email';
                              }
                              return null;
                            },
                            controller: _email_controller),
                        TextFelidFormWidget(
                          hint_text: "Password",
                          label_text: "Enter password",
                          postIcon: Icons.password_rounded,
                          inputIcon: Icons.remove_red_eye,
                          validator: (val) {
                            if (!val!.isValidPassword)
                              return 'Enter valid password';
                            return null;
                          },
                          controller: _password_controller,
                          obsecure: true,
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: const EdgeInsets.only(right: 25),
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) =>
                                        ForgotPasswordPage())));
                              },
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                  AuthBtn(
                      btnName: "LogIn",
                      onPress: () async {
                        await validatedAndSubmit(ref: ref);
                      },
                      width: 150)
                ],
              ),
            ),
    );
    ;
  }
}
