import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/Utils/form_validator.dart';
import 'package:nearfund/app/Auth/auth_page.dart';
import 'package:nearfund/app/Auth/widgets/auth_btn.dart';
import 'package:nearfund/app/Auth/widgets/auth_textfield.dart';
import 'package:nearfund/app/UserDetils/userdetails_page.dart';
import 'package:nearfund/app/loading/loading_page.dart';
import 'package:nearfund/services/authService.dart';

class RegistPage extends ConsumerStatefulWidget {
  RegistPage({Key? key}) : super(key: key);
  @override
  ConsumerState<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends ConsumerState<RegistPage> {
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
            .signUp(
                email: _email_controller.text,
                password: _password_controller.text)
            .then((value) async {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => UserDetailsPage()));
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
                    child: Text(
                      "Sign up with Email",
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
                            if (!val!.isValidPassword) {
                              return 'Enter valid password';
                            }
                            return null;
                          },
                          controller: _password_controller,
                          obsecure: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                  AuthBtn(
                      btnName: "Continue",
                      onPress: () async {
                        await validatedAndSubmit(ref: ref);
                      },
                      width: 150)
                ],
              ),
            ),
    );
  }
}
