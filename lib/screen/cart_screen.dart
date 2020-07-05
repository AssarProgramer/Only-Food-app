import 'package:fajira_grosery/widgets/rasied_button.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final String foodType;
  final double foodPrice;
  final int foodCount;
  CartScreen(
      {this.foodPrice,
      this.foodCount,
      this.foodImage,
      this.foodName,
      this.foodType});

  Widget cartContainer(context) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Container(
            child: CircleAvatar(
              backgroundImage: AssetImage('images/pastascheese3.jpg'),
              radius: 30,
            ),
          ),
          title: Container(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Text(
                  '${foodCount.toString()} ',
                  style: TextStyle(color: Color(0xffc1c6cb), fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '${foodName.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        '${foodType.toString()}',
                        style:
                            TextStyle(color: Color(0xffc1c6cb), fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '\$${foodPrice.toString()}',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text('Cart'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              child: ListView(
                children: <Widget>[
                  cartContainer(
                    context,
                  ),
                  cartContainer(
                    context,
                  ),
                  cartContainer(
                    context,
                  ),
                  cartContainer(
                    context,
                  ),
                  cartContainer(
                    context,
                  ),
                  cartContainer(
                    
                    context,
                  ),
                  cartContainer(
                    context,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          '\$350',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                    RasiedButton(
                      colors: Colors.white,
                      buttonText: 'Submit',
                      textColors: Theme.of(context).primaryColor,
                      whenPrassed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
