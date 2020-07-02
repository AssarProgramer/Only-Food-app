import 'package:flutter/material.dart';

class TextFormFeild extends StatelessWidget {
  final TextEditingController myController;
  final String myInitialValue;
  final String hintText;
  final bool myObscureText;
  final TextInputType keybord;
  TextFormFeild(
      {this.myInitialValue,
      this.hintText,
      this.keybord,
      this.myController,
      this.myObscureText});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        initialValue: myInitialValue,
        keyboardType: keybord,
        obscureText: myObscureText,
        controller: myController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hintText,
          fillColor: Color(0xfffde6f0),
          filled: true,
        ),
      ),
    );
  }
}
