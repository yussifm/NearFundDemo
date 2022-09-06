import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFelidFormWidget extends StatefulWidget {
  TextFelidFormWidget(
      {Key? key,
      required this.hint_text,
      required this.label_text,
      required this.controller,
      this.obsecure = false,
      this.inputFormatters,
      this.validator,
      this.inputIcon,
      this.postIcon})
      : super(key: key);
  final String hint_text;
  final String label_text;
  final TextEditingController controller;
  bool obsecure;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  IconData? inputIcon;
  IconData? postIcon;

  @override
  State<TextFelidFormWidget> createState() => _TextFelidFormWidgetState();
}

class _TextFelidFormWidgetState extends State<TextFelidFormWidget> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: deviceSize.width / 10, vertical: deviceSize.width / 35),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obsecure,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          focusColor: Colors.yellow,
          hintText: widget.hint_text,
          labelText: widget.label_text,
          prefixIcon: Icon(widget.postIcon),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  widget.obsecure = !widget.obsecure;
                });
              },
              icon: Icon(widget.inputIcon)),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
        ),
      ),
    );
  }
}
