import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './login_page.dart';
import '../widgets/textform_feild.dart';
import '../widgets/rasied_button.dart';
import '../widgets/flat_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../model/user.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _netWorkLodding = false;
  bool isMale = true;

  File isImage;
  Future getImage({ImageSource source}) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    setState(() {
      isImage = File(pickedImage.path);
    });
  }

  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final RegExp regex = RegExp(pattern);

  final _auth = FirebaseAuth.instance;
  AuthResult authResult;

  GlobalKey<ScaffoldState> myKey = GlobalKey<ScaffoldState>();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  TextEditingController address = TextEditingController();

  void submitFunction() {
    if (isImage == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill fullName'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    }
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
    } else if (!regex.hasMatch(email.text)) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Please Try Vaild Email"),
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
    if (password.text.isEmpty || password.text.trim() == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill password'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    }

    if (address.text.isEmpty || address.text == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill Address'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }
  }

  Widget firstPart() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2 + 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'SignUp',
                  style: TextStyle(
                    color: Color(0xfffe257e),
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Text(
                  'create an account',
                  style: TextStyle(
                    color: Color(0xfffe6ba7),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              getImage(
                source: ImageSource.camera,
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 60,
              child: CircleAvatar(
                backgroundImage: isImage == null
                    ? AssetImage('images/tonyprofile.jpg')
                    : FileImage(isImage),
                radius: 56,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget secoundPart() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5 + 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextFormFeild(
                    myObscureText: false,
                    hintText: 'Full Name',
                    controller: fullName,
                    keybord: TextInputType.emailAddress,
                  ),
                  TextFormFeild(
                    myObscureText: false,
                    hintText: 'Email',
                    controller: email,
                    keybord: TextInputType.emailAddress,
                  ),
                  TextFormFeild(
                    myObscureText: true,
                    controller: password,
                    keybord: TextInputType.emailAddress,
                    hintText: 'Password',
                  ),
                  TextFormFeild(
                    myObscureText: false,
                    hintText: 'Phonn Number',
                    controller: phoneNumber,
                    keybord: TextInputType.number,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = !isMale;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 20, left: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xfffde6f0),
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      child: Text(
                        isMale ? 'male' : 'Female',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff756b6f),
                        ),
                      ),
                    ),
                  ),
                  TextFormFeild(
                    myObscureText: false,
                    controller: address,
                    keybord: TextInputType.emailAddress,
                    hintText: 'Address',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget thirdPart() {
    return Container(
      child: Column(
        children: <Widget>[
          if (_netWorkLodding)
            CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          if (!_netWorkLodding)
            RasiedButton(
              textColors: Colors.white,
              colors: Theme.of(context).primaryColor,
              buttonText: 'SignUp',
              whenPrassed: () async {
                try {
                  setState(() {
                    _netWorkLodding = true;
                  });
                  authResult = await _auth.createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );

                  User user = User(
                    myImage: isImage,
                    email: email.text,
                    fullName: fullName.text,
                    password: password.text,
                    phoneNumber: int.parse(phoneNumber.text),
                    address: address.text,
                    gender: isMale ? 'Male' : 'Famale',
                  );
                  final ref = FirebaseStorage.instance
                      .ref()
                      .child('User _image')
                      .child(authResult.user.uid + '.jpg');
                  await ref.putFile(isImage).onComplete;
                  final url = await ref.getDownloadURL();

                  await Firestore.instance
                      .collection('user')
                      .document(authResult.user.uid)
                      .setData(
                    {
                      'password': user.password,
                      'email': user.email,
                      'phoneNumber': user.phoneNumber,
                      'fullName': user.fullName,
                      'gender': user.gender,
                      'address': user.address,
                      'image_Url': url,
                    },
                  );
                  submitFunction();
                } on PlatformException catch (err) {
                  var message = 'assar';
                  if (err.message != null) {
                    message = err.message;
                  }
                  myKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Theme.of(context).errorColor,
                    ),
                  );
                  setState(() {
                    _netWorkLodding = false;
                  });
                } catch (erro) {
                  setState(() {
                    _netWorkLodding = false;
                  });
                  myKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(
                        erro,
                      ),
                      backgroundColor: Theme.of(context).errorColor,
                    ),
                  );
                }
                setState(() {
                  _netWorkLodding = false;
                });
              },
            ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.0 + 10,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'already have an account?',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    if (!_netWorkLodding)
                      MyFlatButton(
                        flatButtonText: 'Login',
                        whenPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      backgroundColor: Colors.white,
      body: Form(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  firstPart(),
                  secoundPart(),
                  SizedBox(
                    height: 25,
                  ),
                  thirdPart(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
