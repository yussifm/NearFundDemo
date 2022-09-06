// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/app/Auth/widgets/auth_btn.dart';
import 'package:nearfund/theme/colors.dart';
import 'package:nearfund/widgets/general_textfiled.dart';

class UserDetailsPage extends ConsumerStatefulWidget {
  UserDetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserDetailsPage> createState() => _UserDetailsPageState();
}

enum UserType { student, content }

class _UserDetailsPageState extends ConsumerState<UserDetailsPage> {
  late TextEditingController _about_controller;
  late TextEditingController _name_controller;
  late TextEditingController _link_controller;
  UserType? userType = UserType.content;

  @override
  void initState() {
    _about_controller = TextEditingController();
    _link_controller = TextEditingController();
    _name_controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _about_controller.dispose();
    _name_controller.dispose();
    _link_controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    child: Text("Complete your Page")),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          border: 
                        ),
                        child: const FaIcon(FontAwesomeIcons.camera),
                      ),
                    ),
                    const Text('Add a photo')
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
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
            const SizedBox(
              height: 15,
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  filedtextmethod(name: "Name"),
                  GeneralTextFelidFormWidget(
                    hint_text: 'name',
                    label_text: 'Yussif John',
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
                  filedtextmethod(name: "About"),
                  GeneralTextFelidFormWidget(
                    hint_text: 'About',
                    label_text:
                        'Enter your bio, tell your supporters why they should support you, Content creator or a Student',
                    controller: _about_controller,
                    max_lines: 5,
                    borderRadius: 20,
                    validator: (val) {
                      if (!val!.isNotEmpty) return 'Enter valid name';
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
            const SizedBox(
              height: 20,
            ),
            AuthBtn(btnName: 'Proceed', onPress: () {})
          ]),
        ),
      ),
    );
  }

  Align filedtextmethod({required String name}) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    );
  }
}
