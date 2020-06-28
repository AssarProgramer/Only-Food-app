import '../widgets/textform_feild.dart';
import 'package:fajira_grosery/widgets/rasied_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget textfeildContainer({String textfeildName}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xfffde6f0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15),
        child: Text(textfeildName),
      ),
      height: MediaQuery.of(context).size.height * 0.1 - 25,
    );
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

  final GlobalKey<ScaffoldState> myKey = GlobalKey<ScaffoldState>();

  final TextEditingController gender1 = TextEditingController();
  final TextEditingController addrees = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

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
    if (addrees.text.isEmpty || addrees.text.trim() == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill addrees'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }
    if (gender1.text.isEmpty || gender1.text.trim() == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill gender'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }
  }

  Widget _buildGender() {
    return Container(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          fillColor: Color(0xfffde6f0),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        value: dropdownvalue,
        hint: Text(
          "Gender",
          style: TextStyle(
            color: Color(0xff221f20),
          ),
        ),
        onChanged: (value) {
          setState(
            () {
              dropdownvalue = value;
            },
          );
        },
        validator: (vaule) {
          if (dropdownvalue == null) {
            return "Select Gender";
          }
          return null;
        },
        items: gender.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                setState(() {
                  profileCondition = true;
                });
              })
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 400,
                      child: profileCondition == true
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 440,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      TextFormFeild(
                                        myObscureText: false,
                                        keybord: TextInputType.emailAddress,
                                        initialValue: 'Assarbaloch',
                                      ),
                                      TextFormFeild(
                                        myObscureText: false,
                                        keybord: TextInputType.emailAddress,
                                        initialValue: 'assarbugti@gmail.com',
                                      ),
                                      TextFormFeild(
                                        myObscureText: false,
                                        keybord: TextInputType.emailAddress,
                                        initialValue: '+1305514776',
                                      ),
                                      TextFormFeild(
                                        myObscureText: false,
                                        keybord: TextInputType.emailAddress,
                                        initialValue:
                                            '16 floor, mountainview,ca, Usa ',
                                      ),
                                      _buildGender(),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 440,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      textfeildContainer(
                                        textfeildName: 'Assarbaloch',
                                      ),
                                      textfeildContainer(
                                        textfeildName: 'assarbugti@gmail.com',
                                      ),
                                      textfeildContainer(
                                        textfeildName: '+1305514776',
                                      ),
                                      textfeildContainer(
                                        textfeildName:
                                            '16 floor, mountainview,ca, Usa ',
                                      ),
                                      textfeildContainer(
                                        textfeildName: 'Male',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  profileCondition == true
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.9 + 12,
                          child: RasiedButton(
                            buttonText: 'Update',
                            colors: Theme.of(context).primaryColor,
                            textColors: Colors.white,
                            whenPrassed: () {
                              submitFunction();
                            },
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 140, top: 100),
                  child: CircleAvatar(
                    radius: 69,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: image == null
                          ? AssetImage('images/tonyprofile.jpg')
                          : FileImage(image),
                      radius: 65,
                    ),
                  ),
                ),
              ),
              Padding(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
