// import 'package:fajira_grosery/screen/frist_slide.dart';
// import 'package:fajira_grosery/screen/login_page.dart';
// import 'package:flutter/material.dart';
// import '../screen/home_screen.dart';

// class NavigatorBouttom extends StatefulWidget {
//   @override
//   _NavigatorBouttomState createState() => _NavigatorBouttomState();
// }

// class _NavigatorBouttomState extends State<NavigatorBouttom> {
//   int index = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  Stack(
//         children: <Widget>[
//           Offstage(
//             offstage: index != 0,
//             child:  TickerMode(
//               enabled: index == 0,
//               child:  MaterialApp(home: HomeScreen()),
//             ),
//           ),
//           Offstage(
//             offstage: index != 1,
//             child:TickerMode(
//               enabled: index == 1,
//               child:  MaterialApp(home: LoginPage()),
//             ),
//           ),
//               Offstage(
//             offstage: index != 2,
//             child:TickerMode(
//               enabled: index == 2,
//               child:  MaterialApp(home: FristSlide()),
//             ),
//           ),
//               Offstage(
//             offstage: index != 3,
//             child:TickerMode(
//               enabled: index == 3,
//               child:  MaterialApp(home: LoginPage()),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar:  BottomNavigationBar(
//         currentIndex: index,
//         onTap: (int index) {
//           setState(() {
//             this.index = index;
//           });
//         },
//         items: <BottomNavigationBarItem>[
//            BottomNavigationBarItem(
//             icon:  Icon(Icons.home,color: Colors.black,size: 30,),
//             title:  Text("Left"),
//           ),
//          BottomNavigationBarItem(
//             icon:  Icon(Icons.search,color: Colors.black,size: 30,),
//             title:  Text("Right"),
//           ),
//             BottomNavigationBarItem(
//             icon:  Icon(Icons.notifications_none,color: Colors.black,size: 30,),
//             title:  Text("Right"),
//           ),
//             BottomNavigationBarItem(
//             icon:  Icon(Icons.person_outline,color: Colors.black,size: 30,),
//             title:  Text("Right"),
//           ),
//         ],
//       ),
//     );
//   }
// }
