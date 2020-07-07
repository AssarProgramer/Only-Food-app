import 'package:fajira_grosery/model/food.dart';
import 'package:fajira_grosery/screen/cart_screen.dart';
import 'package:fajira_grosery/widgets/featured_container.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CatagoryProtect extends StatefulWidget {
  @override
  _CatagoryProtectState createState() => _CatagoryProtectState();
}

class _CatagoryProtectState extends State<CatagoryProtect> {
  Food firstFood;
  Food secoundFood;
  Food thirdFood;

  Widget callingBottomPart() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 7,
      childAspectRatio: 0.80,
      children: <Widget>[
        FeaturedContainer(
          foodImage: firstFood.foodImage,
          foodName: firstFood.foodName,
          foodPrice: firstFood.foodPrice,
          foodType: firstFood.foodType,
          foodRating: firstFood.foodRating,
          whenPreesd: () {},
        ),
        FeaturedContainer(
          foodImage: secoundFood.foodImage,
          foodName: secoundFood.foodName,
          foodPrice: secoundFood.foodPrice,
          foodType: secoundFood.foodType,
          foodRating: secoundFood.foodRating,
          whenPreesd: () {},
        ),
        FeaturedContainer(
          foodImage: thirdFood.foodImage,
          foodName: thirdFood.foodName,
          foodPrice: thirdFood.foodPrice,
          foodType: thirdFood.foodType,
          foodRating: thirdFood.foodRating,
          whenPreesd: () {},
        ),
        FeaturedContainer(
          foodImage: 'images/pastascheese3.jpg',
          foodName: 'Pasta Cheese',
          foodPrice: 50,
          foodType: '7 Ocean Hotal',
          foodRating: 4.5,
          whenPreesd: () {},
        ),
        FeaturedContainer(
          foodImage: 'images/pastascheese3.jpg',
          foodName: 'Pasta Cheese',
          foodPrice: 50,
          foodType: '7 Ocean Hotal',
          foodRating: 4.5,
          whenPreesd: () {},
        ),
        FeaturedContainer(
          foodImage: 'images/pastascheese3.jpg',
          foodName: 'Pasta Cheese',
          foodPrice: 50,
          foodType: '7 Ocean Hotal',
          foodRating: 4.5,
          whenPreesd: () {},
        ),
        FeaturedContainer(
          foodImage: 'images/pastascheese3.jpg',
          foodName: 'Pasta Cheese',
          foodPrice: 50,
          foodType: '7 Ocean Hotal',
          foodRating: 4.5,
          whenPreesd: () {},
        ),
        FeaturedContainer(
          foodImage: 'images/pastascheese3.jpg',
          foodName: 'Pasta Cheese',
          foodPrice: 50,
          foodType: '7 Ocean Hotal',
          foodRating: 4.5,
          whenPreesd: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f1f2),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'pastas',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('Category')
            .document('fruits')
            .collection('Pasta Cheese')
            .document('O0W9y3eoTGirXH61N0DZ')
            .snapshots(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          secoundFood = Food(
            foodImage: snapShot.data['foodImage'],
            foodName: snapShot.data['foodName'],
            foodPrice: snapShot.data['foodPrice'],
            foodType: snapShot.data['foodType'],
            foodRating: snapShot.data['foodRating'],
          );

          return StreamBuilder(
            stream: Firestore.instance
                .collection('Category')
                .document('fruits')
                .collection('Chicken Broast')
                .document('j1njXeMoAQGpTIbdal7D')
                .snapshots(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              firstFood = Food(
                foodImage: snapShot.data['foodImage'],
                foodName: snapShot.data['foodName'],
                foodPrice: snapShot.data['foodPrice'],
                foodType: snapShot.data['foodType'],
                foodRating: snapShot.data['foodRating'],
              );
              return StreamBuilder(
                stream: Firestore.instance
                    .collection('Category')
                    .document('fruits')
                    .collection('Fish Fry')
                    .document('b1zc1590EQa8rHIDZowO')
                    .snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  thirdFood = Food(
                    foodImage: snapShot.data['foodImage'],
                    foodName: snapShot.data['foodName'],
                    foodPrice: snapShot.data['foodPrice'],
                    foodType: snapShot.data['foodType'],
                    foodRating: snapShot.data['foodRating'],
                  );
                  return callingBottomPart();
                },
              );
            },
          );
        },
      ),
    );
  }
}
