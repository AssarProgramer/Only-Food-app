import 'package:flutter/material.dart';

class MyTextFormFiled extends StatelessWidget {
  final String name;
    final String myInitialValue;
  final TextEditingController controller;

  final bool obscureText;

  final TextInputType keyborad;
  MyTextFormFiled(
      {this.myInitialValue,this.name, this.obscureText, this.keyborad, this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyborad,
      obscureText: obscureText,
    initialValue: myInitialValue,
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

// import 'package:flutter/material.dart';

// class TextFormFeild extends StatelessWidget {
//   final TextEditingController myController;
//   final String myInitialValue;
//   final String hintText;
//   final bool myObscureText;
//   final TextInputType keybord;
//   TextFormFeild(
//       {this.myInitialValue,
//       this.hintText,
//       this.keybord,
//       this.myController,
//       this.myObscureText});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TextFormField(
//         initialValue: myInitialValue,
//         keyboardType: keybord,
//         obscureText: myObscureText,
//         controller: myController,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           hintText: hintText,
//           fillColor: Color(0xfffde6f0),
//           filled: true,
//         ),
//       ),
//     );
//   }
// }
