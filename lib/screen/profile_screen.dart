import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/textform_feild.dart';
import 'package:fajira_grosery/widgets/rasied_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static User userData;
  bool isMale = false;
  @override
  void initState() {
    super.initState();
    currentuser();
  }

  var uid;
  void currentuser() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    uid = user.uid;
    Firestore.instance
        .collection('user')
        .document(uid)
        .snapshots()
        .listen((event) {
      setState(() {
        userImage = event['image_Url'];
        userData = User(
          email: event['email'],
          fullName: event['fullName'],
          phoneNumber: event['phoneNumber'],
          address: event['address'],
          gender: event['gender'],
          myImage: event['image'],
        );
      });
    });
  }

  bool profileCondition = false;

  List<String> gender = ["Male", "Female"];
  File image;
  Future getImage({ImageSource source}) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    setState(() {
      image = File(pickedImage.path);
    });
  }

  var dropdownvalue;
  String userImage;

  GlobalKey<ScaffoldState> myKey = GlobalKey<ScaffoldState>();

  TextEditingController addrees;
  TextEditingController email;
  TextEditingController fullName;
  TextEditingController phoneNumber;

  void submitFunction() {
    if (fullName.text.isEmpty || fullName.text.trim() == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill fullName'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    } else if (email.text.isEmpty || email.text.trim() == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill email'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    } else if (phoneNumber.text.isEmpty || phoneNumber.text.trim() == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill PhoneNumber'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    } else if (addrees.text.isEmpty || addrees.text.trim() == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill addrees'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }
  }

  Widget textfeildContainer({String textfeildName}) {
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

  Widget secondPart() {
    return Expanded(
      flex: 2,
      child: Container(
        width: 400,
        child: profileCondition == true
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextFormFeild(
                          keybord: TextInputType.number,
                          hintText: 'Full Name',
                          myController: fullName,
                          myObscureText: false,
                        ),
                        TextFormFeild(
                          keybord: TextInputType.text,
                          hintText: 'Email',
                          myController: email,
                          myObscureText: false,
                        ),
                        TextFormFeild(
                          keybord: TextInputType.text,
                          hintText: 'Phone Number',
                          myController: phoneNumber,
                          myObscureText: false,
                        ),
                        TextFormFeild(
                          keybord: TextInputType.text,
                          hintText: 'Phone Number',
                          myController: addrees,
                          myObscureText: false,
                        ),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = !isMale;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xfffde6f0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 19, left: 13.0),
                              child: Text(
                                isMale ? 'Male' : 'Female',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            height:
                                MediaQuery.of(context).size.height * 0.1 - 23,
                          ),
                        ),
                        // _buildGender(),
                      ],
                    ),
                  ),
                  profileCondition == true
                      ? Container(
                          width: double.infinity,
                          child: RasiedButton(
                            buttonText: 'Update',
                            colors: Theme.of(context).primaryColor,
                            textColors: Colors.white,
                            whenPrassed: () {
                              submitFunction();
                            },
                          ))
                      : Container(),
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
      ),
    );
  }

  Widget circle() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 140, top: 120),
        child: CircleAvatar(
          radius: 69,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundImage:
                image == null ? NetworkImage(userImage) : FileImage(image),
            radius: 65,
          ),
        ),
      ),
    );
  }

  Widget editCircleButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 100, bottom: 330),
      child: Center(
        child: profileCondition == true
            ? CircleAvatar(
                backgroundColor: Colors.white,
                radius: 18,
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    getImage(
                      source: ImageSource.camera,
                    );

                    Text(
                      "From Gallery",
                    );
                  },
                ),
              )
            : Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      fullName = TextEditingController(text: userData.fullName);
      email = TextEditingController(text: userData.email);
      phoneNumber =
          TextEditingController(text: userData.phoneNumber.toString());
      addrees = TextEditingController(text: userData.address);
    });

    return Scaffold(
      key: myKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: profileCondition == false
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
                    profileCondition = false;
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
                  profileCondition = true;
                },
              );
            },
          )
        ],
      ),
      body: Container(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  secondPart(),
                ],
              ),
              circle(),
              editCircleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
