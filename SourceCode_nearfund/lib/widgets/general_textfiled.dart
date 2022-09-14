// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneralTextFelidFormWidget extends StatefulWidget {
  const GeneralTextFelidFormWidget(
      {Key? key,
      required this.hint_text,
      required this.label_text,
      required this.controller,
      this.obsecure = false,
      this.max_lines = 1,
      this.Key_Type = TextInputType.text,
      this.inputFormatters,
      this.validator,
      this.borderRadius = 5})
      : super(key: key);
  final String hint_text;
  final String label_text;
  final TextEditingController controller;
  final bool obsecure;
  final int max_lines;
  final TextInputType Key_Type;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final double borderRadius;

  @override
  State<GeneralTextFelidFormWidget> createState() =>
      _GeneralTextFelidFormWidgetState();
}

class _GeneralTextFelidFormWidgetState
    extends State<GeneralTextFelidFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        style: const TextStyle(fontSize: 15),
        controller: widget.controller,
        obscureText: widget.obsecure,
        keyboardType: widget.Key_Type,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        maxLines: widget.max_lines,
        decoration: InputDecoration(
          hintText: widget.hint_text,
          labelText: widget.label_text,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius)),
          ),
        ),
      ),
    );
  }
}
