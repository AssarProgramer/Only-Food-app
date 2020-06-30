import 'package:flutter/material.dart';

class TextFormFeild extends StatefulWidget {
  final TextEditingController myController;

  final String hintText;
  final bool myObscureText;
  final TextInputType keybord;

  TextFormFeild({
    this.myController,
    this.myObscureText,
    this.keybord,
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
          controller: widget.myController,
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
