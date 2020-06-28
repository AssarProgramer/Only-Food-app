// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import '../model/food.dart';

// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     MyProduct myProduct;

//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         height: 500,
//         width: 400,
//         color: Colors.blue,
//         child: Column(
//           children: <Widget>[
//             RaisedButton(
//               onPressed: () {
//                 myProduct = MyProduct(
//                   foodImage: "images/myimage.jpg",
//                   foodName: "Daal",
//                   foodPrice: 20,
//                   foodTitleName: "7 coean hotel",
//                   foodunit: "5",
//                   rating: "4.2",
//                 );
//                 Firestore.instance.collection("food").add(
//                   {
//                     "FoodImage": myProduct.foodImage,
//                     "FoodName": myProduct.foodName,
//                     "FoodPrice": myProduct.foodPrice,
//                     "FoodTitleName": myProduct.foodTitleName,
//                     'FoodUnit': myProduct.foodunit,
//                     'FoodRating': myProduct.rating,
//                   },
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
