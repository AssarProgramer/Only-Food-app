import 'package:fajira_grosery/screen/cart_screen.dart';
import 'package:fajira_grosery/screen/catagory_protect.dart';
import 'package:fajira_grosery/screen/contact_screen.dart';
import 'package:fajira_grosery/screen/detile_page.dart';
import 'package:fajira_grosery/screen/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/featured_container.dart';
import './about_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/food.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Food food;

  @override
  void initState() {
    // food = Food(
    //     foodImage: '5453',
    //     foodName: 'sadsa',
    //     foodPrice: 20,
    //     foodTitle: 'title',
    //     rating: 30);
    super.initState();
    Firestore.instance
        .collection('Food')
        .document('MHO1ZqiTw2TtAzLs66KT')
        .snapshots()
        .listen(
      (event) {
        print(event['foodName']);
        print(event['foodType']);
        setState(() {
          food = Food(
            foodImage: event['foodImage'],
            foodName: event['foodName'],
            foodPrice: event['foodPrice'],
            foodType: event['foodType'],
            foodRating: event['foodRating'],
          );
        });
      },
    );
  }

  Widget plzza({String foodImage, String foodName, Function whenPreesed}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: whenPreesed,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.2 + 20,
              width: MediaQuery.of(context).size.width * 0.3 + 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(
                    foodImage,
                    height: MediaQuery.of(context).size.height * 0.1 + 10,
                  ),
                  Text(
                    foodName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget circle() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            minRadius: 50,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              maxRadius: 45,
              backgroundImage: AssetImage('images/tonyprofile.jpg'),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'How You upset',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'stomach?',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget search() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height * 0.5 - 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Want to search anything',
              fillColor: Colors.white,
              filled: true,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget icon() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.category,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget drawerColumn({String name, IconData icon, Function whenPreesed}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8.5),
      child: Container(
        child: ListTile(
          onTap: whenPreesed,
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Container(
              child: Text(
                name,
                style: TextStyle(fontSize: 17, color: Color(0xff2b2b2b)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      drawer: Container(
        color: Colors.red,
        child: Drawer(
          child: SafeArea(
            child: Container(
              color: Color(0xfff8f8f8),
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 80,
                    child: DrawerHeader(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'tesste',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  drawerColumn(
                      icon: Icons.home,
                      name: 'Home',
                      whenPreesed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      }),
                  drawerColumn(
                      icon: Icons.add_shopping_cart,
                      name: 'Cart',
                      whenPreesed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CartScreen(),
                          ),
                        );
                      }),
                  drawerColumn(
                    icon: Icons.location_on,
                    name: 'Address',
                  ),
                  drawerColumn(
                    icon: Icons.notifications_none,
                    name: 'Notifications',
                  ),
                  drawerColumn(
                    icon: Icons.perm_identity,
                    name: 'Profile',
                    whenPreesed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                  ),
                  drawerColumn(
                    icon: Icons.perm_identity,
                    name: 'Orders',
                  ),
                  Divider(
                    color: Color(0xffe5dddd),
                  ),
                  drawerColumn(
                    icon: Icons.info_outline,
                    name: 'About',
                    whenPreesed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AboutScreen(),
                        ),
                      );
                    },
                  ),
                  drawerColumn(
                    icon: Icons.phone,
                    name: 'Contact',
                    whenPreesed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Contact()));
                    },
                  ),
                  Divider(
                    color: Color(0xffe5dddd),
                  ),
                  drawerColumn(
                    icon: Icons.exit_to_app,
                    name: 'Logout',
                    whenPreesed: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {})
        ],
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff0f1f2),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: mediaQueryData.size.height * 0.2 + 50,
                    // height: MediaQuery.of(context).size.height * 0.1 + 50,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            plzza(
                              whenPreesed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CatagoryProtect(),
                                  ),
                                );
                              },
                              foodImage: 'images/pizza1.png',
                              foodName: 'pastas',
                            ),
                            plzza(
                              foodImage: 'images/salads.png',
                              foodName: 'GreenTea',
                            ),
                            plzza(
                              foodImage: 'images/salads.png',
                              foodName: 'GreenTea',
                            ),
                            plzza(
                              foodImage: 'images/salads.png',
                              foodName: 'GreenTea',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Featured',
                          style: TextStyle(
                              fontSize: 23,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => CatagoryProtect()),
                            );
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                                fontSize: 17, color: Color(0xff04d4ee)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        FeaturedContainer(
                          foodImage: food.foodImage,
                          foodName: food.foodName,
                          foodPrice: food.foodPrice,
                          foodType: food.foodType,
                          foodRating: food.foodRating,
                          whenPreesd: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetilePage()));
                          },
                        ),
                        FeaturedContainer(
                          whenPreesd: () {},
                          foodImage: 'images/chicken4.jpg',
                          foodName: 'Chicken Bros',
                          foodPrice: 40,
                          foodType: 'Marine Star Hotal',
                          foodRating:4.5,
                        ),
                        FeaturedContainer(
                          whenPreesd: () {},
                          foodImage: 'images/chicken4.jpg',
                          foodName: 'Chicken Bross',
                          foodPrice: 40,
                          foodType: 'Marine Star Hotal',
                           foodRating:4.5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2 + 40,
              color: Theme.of(context).primaryColor,
              child: Column(
                children: <Widget>[
                  circle(),
                ],
              ),
            ),
            search(),
          ],
        ),
      ),
    );
  }
}
