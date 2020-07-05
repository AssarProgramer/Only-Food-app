import 'package:fajira_grosery/model/user.dart';
import 'package:fajira_grosery/widgets/my_list_tile.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final User user;
  Profile({this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 420,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MyListTile(
                  myText: user.fullName,
                ),
                MyListTile(
                  myText: user.email,
                ),
                MyListTile(
                  myText: user.phoneNumber.toString(),
                ),
                MyListTile(
                  myText: user.gender.toString(),
                ),
                MyListTile(myText: user.address),
              ],
            ),
          ),
          Container(
            height: 70,
          )
        ],
      ),
    );
  }
}
