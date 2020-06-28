// import 'package:fajira_grosery/model/food.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Tests extends StatefulWidget {
//   @override
//   _TestsState createState() => _TestsState();
// }

// class _TestsState extends State<Tests> {
//   MyProduct myProduct = MyProduct(
//     foodImage: 'Janibugti',
//     foodName: 'jani',
//     foodPrice: 20,
//     foodTitleName: 'jani',
//     foodunit: 'assarbugti',
//     rating: 'assar',
//   );

  // @override
  // void initState() {
  //   Firestore.instance.collection("food").snapshots().listen((event) {
  //     event.documents.forEach((element) {
  //       setState(() {
  //         myProduct = MyProduct(
  //           foodImage: element['FoodImage'],
  //           foodName: element['FoodPrice'],
  //           foodPrice: element['FoodUnit'],
  //           foodTitleName: element['FoodPrice'],
  //           foodunit: element['FoodTitleName'],
  //           rating: element['FoodRating'],
  //         );
  //       });
  //     });
  //   });
  //   super.initState();
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: double.infinity,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Center(
//                 child: Container(
//                   height: 40,
//                   child: RaisedButton(
//                     child: Text(myProduct.foodPrice.toString()),
//                     onPressed: () {},
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
