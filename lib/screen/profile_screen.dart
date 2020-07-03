import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import './home_screen.dart';
import '../widgets/textform_feild.dart';
import 'package:fajira_grosery/widgets/rasied_button.dart';

import '../model/user.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static User userData;
  TextEditingController fullName;

  TextEditingController email;
  TextEditingController phoneNumber;

  TextEditingController address;

  File image;
  bool isMale = false;
  bool profileCodiction = false;
  var uid;

  void inputUserData() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    uid = user.uid;
  }

  void checkGender() {
    if (userData.gender == "Male") {
      isMale = true;
    } else {
      isMale = false;
    }
  }

  void userDataUpdate() {
    Firestore.instance.collection("user").document(uid).updateData({
      "fullName": fullName.text,
      "email": email.text,
      "address": address.text,
      "phoneNumber": int.parse(phoneNumber.text),
      "gender": isMale == true ? "Male" : "Female",
    });
  }

  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final RegExp regex = RegExp(pattern);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String userImage;

  Future getImage({ImageSource source}) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      image = File(pickedFile.path);
    });
  }

  void submitFunction() {
    if (fullName.text.trim() == null || fullName.text.isEmpty) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("FullName Is Empty"),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (email.text.isEmpty || email.text.trim() == null) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Email is Empty"),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (!regex.hasMatch(email.text)) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Please Try Vaild Email"),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (phoneNumber.text.isEmpty) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Phone Number is Empty"),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (int.tryParse(phoneNumber.text) == null) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Please Enter Vaild Number"),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (int.tryParse(phoneNumber.text) < 0) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Phone Number  Not Less then 0"),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (phoneNumber.text.length < 11 || phoneNumber.text.length > 11) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Phone number must be equal 11"),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else {
      setState(() {
        profileCodiction = false;
      });
      userDataUpdate();
    }
  }

  Widget textfeildContainer({String textfeildName}) {
    checkGender();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xfffde6f0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 19, left: 13.0),
        child: Text(
          textfeildName,
          style: TextStyle(fontSize: 16),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.1 - 23,
    );
  }

  Widget secountPart() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: profileCodiction == true
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MyTextFormFiled(
                  name: "FullName",
                  obscureText: false,
                  controller: fullName,
                ),
                MyTextFormFiled(
                  name: 'Email',
                  obscureText: false,
                  controller: email,
                ),
                MyTextFormFiled(
                  name: "PhoneNumber",
                  obscureText: false,
                  controller: phoneNumber,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = !isMale;
                    });
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      color: Color(0xfffde6f0),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        isMale ? "Male" : "Female",
                        style:
                            TextStyle(fontSize: 17, color: Color(0xff757173)),
                      ),
                    ),
                  ),
                ),
                MyTextFormFiled(
                  obscureText: false,
                  name: "Address",
                  controller: address,
                ),
                RasiedButton(
                  buttonText: 'Update',
                  colors: Theme.of(context).primaryColor,
                  textColors: Colors.white,
                  whenPrassed: () {
                    submitFunction();
                  },
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      textfeildContainer(
                        textfeildName: userData.fullName,
                      ),
                      textfeildContainer(
                        textfeildName: userData.email,
                      ),
                      textfeildContainer(
                        textfeildName: userData.phoneNumber.toString(),
                      ),
                      textfeildContainer(textfeildName: userData.address),
                      textfeildContainer(
                        textfeildName: userData.gender.toString(),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 49,
                ),
              ],
            ),
    );
  }

  Widget topImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 360),
            child: CircleAvatar(
              radius: 75,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: image == null
                    ? AssetImage("images/tonyprofile.jpg")
                    : FileImage(image),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    inputUserData();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        leading: profileCodiction == false
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            : IconButton(
                icon: Icon(
                  Icons.close,
                ),
                onPressed: () {
                  setState(() {
                    profileCodiction = false;
                  });
                },
              ),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 17),
        ),
        actions: <Widget>[
          IconButton(
            icon: Text(
              'Edit',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            onPressed: () {
              setState(
                () {
                  profileCodiction = true;
                },
              );
            },
          )
        ],
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection("user").snapshots(),
          builder: (ctx, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            var myDocument = snapShot.data.documents;
            myDocument.forEach((checkDocument) {
              if (uid == checkDocument["userId"]) {
                userData = User(
                    email: checkDocument['email'],
                    address: checkDocument["address"],
                    gender: checkDocument["gender"],
                    myImage: null,
                    fullName: checkDocument["fullName"],
                    phoneNumber: checkDocument["phoneNumber"]);
                userImage = checkDocument["image_Url"];
                phoneNumber = TextEditingController(
                    text: userData.phoneNumber.toString());
                fullName = TextEditingController(text: userData.fullName);
                email = TextEditingController(text: userData.email);
                address = TextEditingController(text: userData.address);
              }
            });

            return Container(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            color: Theme.of(context).primaryColor,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: secountPart(),
                        )
                      ],
                    ),
                  ),
                  topImage(),
                  profileCodiction == true
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 300, left: 130),
                          child: Center(
                              child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 19,
                            child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  getImage(source: ImageSource.camera);
                                },),
                          ),),)
                      : Container(),
                ],
              ),
            );
          },),
    );
  }
}
