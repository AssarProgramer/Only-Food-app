import 'package:fajira_grosery/widgets/rasied_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './signup.dart';
import '../widgets/textform_feild.dart';
import '../widgets/flat_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var netWorkLodding = false;

  final _auth = FirebaseAuth.instance;
  AuthResult authResult;

  GlobalKey<ScaffoldState> myKey = GlobalKey<ScaffoldState>();

  TextEditingController password = TextEditingController();

  TextEditingController email = TextEditingController();

  void submitFunction() {
    if (email.text.isEmpty || email.text.trim() == null) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text('please fill email'),
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
    }
  }

  Widget loginText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Login',
          style: TextStyle(
            color: Color(0xfffe257e),
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        Text(
          'welcome back!',
          style: TextStyle(
            color: Color(0xfffe6ba7),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ],
    );
  }

  Widget textFeild() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TextFormFeild(
          controller: email,
          hintText: 'Email',
          myObscureText: false,
          keybord: TextInputType.emailAddress,
        ),
        TextFormFeild(
          controller: password,
          hintText: 'Password',
          myObscureText: true,
          keybord: TextInputType.emailAddress,
        ),
      ],
    );
  }

  Widget signUpButton() {
    return Container(
      width: 245,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: Text(
                  'Don\'have an account?',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              if (!netWorkLodding)
                MyFlatButton(
                  flatButtonText: 'SignUp',
                  whenPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                ),
            ],
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.2 + 40,
                  child: loginText(),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3 - 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: textFeild(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 - 55,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      if (netWorkLodding)
                        Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Colors.red,
                        )),
                      if (!netWorkLodding)
                        RasiedButton(
                          colors: Theme.of(context).primaryColor,
                          textColors: Colors.white,
                          buttonText: 'Login',
                          whenPrassed: () async {
                            try {
                              setState(
                                () {
                                  netWorkLodding = true;
                                },
                              );
                              authResult =
                                  await _auth.signInWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
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
                                ),
                              );
                              setState(
                                () {
                                  netWorkLodding = false;
                                },
                              );
                            } catch (err) {
                              setState(() {
                                netWorkLodding = false;
                              });
                              myKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text(
                                    err,
                                  ),
                                  backgroundColor: Theme.of(context).errorColor,
                                ),
                              );
                            }
                            setState(
                              () {
                                netWorkLodding = false;
                              },
                            );
                          },
                        ),
                      signUpButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
