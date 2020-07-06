import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/profile.dart';
import '../widgets/profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static User user;
  bool editMode = false;
  File image;
  var uid;
  Future<String> _uploadFile(File _image) async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('images/${user.imagePath}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    StorageTaskSnapshot task = await uploadTask.onComplete;
    final String _imageUrl = (await task.ref.getDownloadURL());

    return _imageUrl;
  }

  var imageMap;
  void checkVerify(phoneNumber, email, gender, address, fullName) async {
    setState(() {
      editMode = false;
    });
    image != null ? imageMap = await _uploadFile(image) : Container();
    Firestore.instance.collection("user").document(uid).updateData(
      {
        "fullName": fullName,
        "email": email,
        "address": address,
        "phoneNumber": int.parse(phoneNumber),
        "gender": gender,
        "UserImage": image == null ? user.myImage : imageMap,
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String userImage;

  Future getImage({ImageSource source}) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      image = File(pickedFile.path);
    });
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
                    ? NetworkImage(user.myImage)
                    : FileImage(image),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getUserId() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    uid = user.uid;
  }

  @override
  Widget build(BuildContext context) {
    getUserId();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        leading: editMode == false
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
                    editMode = false;
                  });
                },
              ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 18),
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
                  editMode = true;
                },
              );
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("user").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          var myDocument = snapshot.data.documents;

          myDocument.forEach(
            (checkDocument) {
              if (uid == checkDocument["userId"]) {
                user = User(
                  imagePath: checkDocument["UserPath"],
                  email: checkDocument['email'],
                  address: checkDocument["address"],
                  gender: checkDocument["gender"],
                  fullName: checkDocument["fullName"],
                  phoneNumber: checkDocument["phoneNumber"],
                  myImage: checkDocument["UserImage"],
                );
              }
            },
          );

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
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: editMode
                            ? ProfileEdit(
                                scaffoldKey: _scaffoldKey,
                                user: user,
                                checkVeriy: checkVerify,
                              )
                            : Profile(user: user),
                      ),
                    ],
                  ),
                ),
                topImage(),
                Padding(
                  padding: EdgeInsets.only(bottom: 300, left: 130),
                  child: Center(
                    child: editMode == true
                        ? CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 19,
                            child: IconButton(
                              onPressed: () {
                                getImage(
                                  source: ImageSource.camera,
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
