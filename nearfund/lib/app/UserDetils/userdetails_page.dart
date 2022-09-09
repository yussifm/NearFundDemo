// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/Utils/form_validator.dart';
import 'package:nearfund/app/Auth/widgets/auth_btn.dart';
import 'package:nearfund/app/mainPage/main_page.dart';
import 'package:nearfund/models/user_model.dart';
import 'package:nearfund/theme/colors.dart';
import 'package:nearfund/widgets/general_textfiled.dart';

import '../../services/UserService.dart';
import '../../services/authService.dart';

class UserDetailsPage extends ConsumerStatefulWidget {
  UserDetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserDetailsPage> createState() => _UserDetailsPageState();
}

enum UserType { student, content }

class _UserDetailsPageState extends ConsumerState<UserDetailsPage> {
  late TextEditingController _about_controller;
  late TextEditingController _name_controller;
  late TextEditingController _phone_controller;
  late TextEditingController _link_controller;
  final _userformKey = GlobalKey<FormState>();
  UserType? userType = UserType.content;
  bool _loading = false;

  @override
  void initState() {
    _about_controller = TextEditingController();
    _link_controller = TextEditingController();
    _name_controller = TextEditingController();
    _phone_controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _about_controller.dispose();
    _name_controller.dispose();
    _link_controller.dispose();
    _phone_controller.dispose();
    super.dispose();
  }

  bool validationAndSave() {
    final form = _userformKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  validatedAndSubmit({required WidgetRef ref, required String userType}) async {
    final autState = ref.watch(authServiceProvide);
    final userState = ref.watch(userServiceProvide);

    if (validationAndSave()) {
      setState(() {
        _loading = true;
      });
      try {
        await userState
            .createUser(
                user: UserModel(
                    uId: autState.getCurrentUser()!.uid,
                    name: _name_controller.text,
                    about: _about_controller.text,
                    imgUrl: '',
                    userType: userType,
                    userLink: _link_controller.text,
                    contact: _phone_controller.text,
                    createdAt: FieldValue.serverTimestamp()),
                userId: autState.getCurrentUser()!.uid)
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.chevronLeft),
            ),
          ),
          const SizedBox(height: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Complete your Page",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  )),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: DottedBorder(
                      padding: const EdgeInsets.all(24),
                      color: Colors.black54,
                      borderType: BorderType.Circle,
                      child: const FaIcon(FontAwesomeIcons.camera),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Add a photo',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    value: UserType.content,
                    groupValue: userType,
                    onChanged: ((UserType? value) {
                      setState(() {
                        userType = value;
                      });
                    }),
                    title: Text(
                      "Content Creator".toUpperCase(),
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: userType == UserType.content
                            ? FontWeight.w800
                            : FontWeight.normal,
                        color: userType == UserType.content
                            ? Colors.amber[900]
                            : Colors.black,
                      ),
                    ),
                    activeColor: Colors.amber.shade900,
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: UserType.student,
                    groupValue: userType,
                    onChanged: ((UserType? value) {
                      setState(() {
                        userType = value;
                      });
                    }),
                    title: Text(
                      "Student".toUpperCase(),
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: userType == UserType.student
                            ? FontWeight.w800
                            : FontWeight.normal,
                        color: userType == UserType.student
                            ? Colors.amber[900]
                            : Colors.black,
                      ),
                    ),
                    activeColor: Colors.amber.shade900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _userformKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  filedtextmethod(name: "Name"),
                  GeneralTextFelidFormWidget(
                    hint_text: 'Yussif John',
                    label_text: 'Name',
                    validator: (val) {
                      if (!val!.isNotEmpty) return 'Enter valid name';
                      return null;
                    },
                    controller: _name_controller,
                    borderRadius: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  filedtextmethod(name: "Contact/Momo number"),
                  GeneralTextFelidFormWidget(
                    hint_text: '+2330540000000',
                    label_text: 'Phone',
                    validator: (val) {
                      if (!val!.isValidPhone) return 'Enter valid phone number';
                      return null;
                    },
                    controller: _phone_controller,
                    borderRadius: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  filedtextmethod(name: "About"),
                  GeneralTextFelidFormWidget(
                    hint_text:
                        'Enter your bio, tell your supporters why they should support you, Content creator or a Student',
                    label_text: 'About',
                    controller: _about_controller,
                    max_lines: 5,
                    borderRadius: 20,
                    validator: (val) {
                      if (!val!.isNotEmpty) return 'Enter bio';
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  filedtextmethod(name: "Website or Social link"),
                  GeneralTextFelidFormWidget(
                      hint_text: 'https://',
                      label_text: 'https://',
                      borderRadius: 20,
                      controller: _name_controller),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AuthBtn(btnName: 'Proceed', onPress: () {})
        ]),
      ),
    );
  }

  Align filedtextmethod({required String name}) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
      ),
    );
  }
}
