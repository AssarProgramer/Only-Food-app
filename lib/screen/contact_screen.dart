import 'package:fajira_grosery/widgets/rasied_button.dart';
import 'package:fajira_grosery/widgets/textform_feild.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  GlobalKey<ScaffoldState> myKey = GlobalKey<ScaffoldState>();

  TextEditingController phoneNumber = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController fullName = TextEditingController();

  TextEditingController yourMessage = TextEditingController();

  void submitFunction() {
    if (fullName.text.isEmpty || fullName.text.trim() == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill fullName'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    }
    if (email.text.isEmpty || email.text.trim() == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill email'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    }
    if (phoneNumber.text.isEmpty || phoneNumber.text.trim() == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill PhoneNumber'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    }
    if (yourMessage.text.isEmpty || yourMessage.text.trim() == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill Your messge'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: myKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Contact',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.6 + 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextFormFeild(
                          hintText: 'Full Name',
                          controller: fullName,
                          keybord: TextInputType.emailAddress,
                          myObscureText: false,
                        ),
                        TextFormFeild(
                          hintText: 'Email',
                          controller: fullName,
                          keybord: TextInputType.emailAddress,
                          myObscureText: false,
                        ),
                        TextFormFeild(
                          hintText: 'PhoneNumber',
                          controller: phoneNumber,
                          keybord: TextInputType.emailAddress,
                          myObscureText: false,
                        ),
                        TextFormFeild(
                          hintText: 'Your Message',
                          controller: yourMessage,
                          keybord: TextInputType.emailAddress,
                          myObscureText: false,
                        ),
                      ],
                    ),
                  ),
                  RasiedButton(
                    buttonText: 'Send',
                    colors: Colors.red,
                    textColors: Colors.white,
                    whenPrassed: () {
                      submitFunction();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
