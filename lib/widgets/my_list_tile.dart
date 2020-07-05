import 'package:flutter/material.dart';
class MyListTile extends StatelessWidget {
  final String myText;
  MyListTile({this.myText});
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xfffde6f0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 19, left: 13.0),
        child: Text(
          myText,
          style: TextStyle(fontSize: 16),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.1 - 23,
    );
  }
}