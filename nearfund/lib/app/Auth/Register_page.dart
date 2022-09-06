import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/Utils/form_validator.dart';
import 'package:nearfund/app/Auth/widgets/auth_btn.dart';
import 'package:nearfund/app/Auth/widgets/auth_textfield.dart';

class RegistPage extends ConsumerStatefulWidget {
  RegistPage({Key? key}) : super(key: key);
  @override
  ConsumerState<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends ConsumerState<RegistPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _email_controller;
  late TextEditingController _password_controller;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          ),
          const Text("Sign up with Email"),
          Form(
            key: _formKey,
            child: Column(
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
                    if (!val!.isValidPassword) return 'Enter valid password';
                    return null;
                  },
                  controller: _password_controller,
                  obsecure: true,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          AuthBtn(btnName: "Continue", onPress: () {})
        ],
      )),
    );
  }
}
