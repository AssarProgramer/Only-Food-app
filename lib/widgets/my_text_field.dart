import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String name;

  final TextEditingController controller;

  final bool obscureText;

  final TextInputType keyborad;
  MyTextField(
      {
      this.name,
      this.obscureText,
      this.keyborad,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller:controller,
      keyboardType: keyborad,
      obscureText: obscureText,
      decoration: InputDecoration(
          fillColor: Color(0xfffde6f0),
          filled: true,
          hintText: name,
          hintStyle: TextStyle(fontWeight: FontWeight.w600),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
    );
  }
}