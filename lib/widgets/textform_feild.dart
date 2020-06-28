import 'package:flutter/material.dart';

class TextFormFeild extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String initialValue;
  final bool myObscureText;
  final TextInputType keybord;

  TextFormFeild({
    this.controller,
    this.myObscureText,
    this.keybord,
    this.initialValue,
    this.hintText,
  });
  @override
  _TextFormFeildState createState() => _TextFormFeildState();
}

class _TextFormFeildState extends State<TextFormFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: TextFormField(
          keyboardType: widget.keybord,
          obscureText: widget.myObscureText,
          controller: widget.controller,
          initialValue: widget.initialValue,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: '${widget.hintText}',
            fillColor: Color(0xfffde6f0),
            filled: true,
          ),
        ),
      ),
    );
  }
}
