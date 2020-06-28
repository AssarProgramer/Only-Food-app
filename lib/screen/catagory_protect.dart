import 'package:fajira_grosery/screen/cart_screen.dart';
import 'package:fajira_grosery/widgets/featured_container.dart';
import 'package:flutter/material.dart';

class CatagoryProtect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          FeaturedContainer(
            foodImage: 'images/pastascheese3.jpg',
            foodName: 'Pasta Cheese',
            foodPrice: 50,
            foodType: '7 Ocean Hotal',
            foodRating:4.5,
            whenPreesd: () {},
          ),
          FeaturedContainer(
            foodImage: 'images/pastascheese3.jpg',
            foodName: 'Pasta Cheese',
            foodPrice: 50,
            foodType: '7 Ocean Hotal',
            foodRating:4.5,
            whenPreesd: () {},
          ),
          FeaturedContainer(
            foodImage: 'images/pastascheese3.jpg',
            foodName: 'Pasta Cheese',
            foodPrice: 50,
            foodType: '7 Ocean Hotal',
            foodRating:4.5,
            whenPreesd: () {},
          ),
          FeaturedContainer(
            foodImage: 'images/pastascheese3.jpg',
            foodName: 'Pasta Cheese',
            foodPrice: 50,
            foodType: '7 Ocean Hotal',
              foodRating:4.5,
            whenPreesd: () {},
          ),
          FeaturedContainer(
            foodImage: 'images/pastascheese3.jpg',
            foodName: 'Pasta Cheese',
            foodPrice: 50,
            foodType: '7 Ocean Hotal',
              foodRating:4.5,
            whenPreesd: () {},
          ),
          FeaturedContainer(
            foodImage: 'images/pastascheese3.jpg',
            foodName: 'Pasta Cheese',
            foodPrice: 50,
            foodType: '7 Ocean Hotal',
              foodRating:4.5,
            whenPreesd: () {},
          ),
          FeaturedContainer(
            foodImage: 'images/pastascheese3.jpg',
            foodName: 'Pasta Cheese',
            foodPrice: 50,
            foodType: '7 Ocean Hotal',
        foodRating:4.5,
            whenPreesd: () {},
          ),
          FeaturedContainer(
            foodImage: 'images/pastascheese3.jpg',
            foodName: 'Pasta Cheese',
            foodPrice: 50,
            foodType: '7 Ocean Hotal',
        foodRating:4.5,
            whenPreesd: () {},
          ),
        ],
      ),
    );
  }
}
