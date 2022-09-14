import 'dart:ui';

import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Expanded(
            child: Divider(
          thickness: 0.6,
        )),
        Text(
          "OR",
          style: TextStyle(color: Colors.black.withOpacity(0.6)),
        ),
        const Expanded(
            child: Divider(
          thickness: 0.6,
        )),
      ]),
    );
  }
}
