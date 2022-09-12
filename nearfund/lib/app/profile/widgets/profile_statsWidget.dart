import 'package:flutter/material.dart';

class ProfileStatsWidget extends StatelessWidget {
  const ProfileStatsWidget({Key? key, required this.name, required this.number})
      : super(key: key);

  final String number;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Text(number,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 15))),
      Expanded(
        child: Text(
          name.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
      )
    ]);
  }
}
