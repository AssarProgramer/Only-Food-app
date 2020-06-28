import 'package:fajira_grosery/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xffff3ea5),
        accentColor: Color(0xff04d4ee),
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return HomeScreen();
          }

          return LoginPage();
        },
      ),
    );
  }
}
