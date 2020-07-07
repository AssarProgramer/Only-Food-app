import '../model/user.dart';

import 'package:flutter/material.dart';

import 'my_text_field.dart';
import 'rasied_button.dart';

class ProfileEdit extends StatefulWidget {
  final User user;
  final scaffoldKey;
  final Function checkVeriy;
  ProfileEdit({@required this.scaffoldKey, this.user, this.checkVeriy});

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final RegExp regex = RegExp(pattern);
  TextEditingController fullName;

  TextEditingController email;

  TextEditingController phoneNumber;

  TextEditingController address;

  String gender = 'Male';

  @override
  void initState() {
    super.initState();

    fullName = TextEditingController(text: widget.user.fullName);
    email = TextEditingController(text: widget.user.email);
    phoneNumber =
        TextEditingController(text: widget.user.phoneNumber.toString());
    address = TextEditingController(text: widget.user.address);
  }

  void checkGender() {
    setState(() {
      gender == 'Male' ? gender = 'Female' : gender = 'Male';
    });
  }

  void checkValid() {
    if (fullName.text.trim() == null || fullName.text.isEmpty) {
      widget.scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("FullName Is Empty"),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (email.text.isEmpty || email.text.trim() == null) {
      widget.scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Email is Empty"),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (!regex.hasMatch(email.text)) {
      widget.scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Please Try Vaild Email"),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (phoneNumber.text.isEmpty) {
      widget.scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Phone Number is Empty"),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (int.tryParse(phoneNumber.text) == null) {
      widget.scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Please Enter Vaild Number"),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (int.tryParse(phoneNumber.text) < 0) {
      widget.scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Phone Number  Not Less then 0"),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else {
      widget.checkVeriy(
        phoneNumber.text,
        email.text,
        gender,
        address.text,
        fullName.text,
      );
    }
  }

  Widget listItems() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyTextField(
            name: "FullName",
            obscureText: false,
            controller: fullName,
          ),
          MyTextField(
            name: 'Email',
            obscureText: false,
            controller: email,
          ),
          MyTextField(
            name: "PhoneNumber",
            obscureText: false,
            controller: phoneNumber,
          ),
          GestureDetector(
            onTap: checkGender,
            child: Container(
              height: 60,
              width: double.infinity,
              padding: EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                color: Color(0xffaee4f2),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  gender,
                  style: TextStyle(fontSize: 17, color: Color(0xff221f20)),
                ),
              ),
            ),
          ),
          MyTextField(
            obscureText: false,
            name: "Address",
            controller: address,
          ),
          RasiedButton(
            buttonText: 'Update',
            colors: Theme.of(context).primaryColor,
            textColors: Colors.white,
            whenPrassed: () {
              checkValid();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return listItems();
  }
}
