import 'package:fajira_grosery/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/rasied_button.dart';
import 'package:provider/provider.dart';
import '../provider/myprovider.dart';

class DetilePage extends StatefulWidget {
  final String foodImage;
  final String foodName;
  final String foodType;
  final double foodPrice;

  DetilePage({
    this.foodImage,
    this.foodName,
    this.foodPrice,
    this.foodType,
  });
  @override
  _DetilePageState createState() => _DetilePageState();
}

class _DetilePageState extends State<DetilePage> {
  int value = 1;
  double total;

  Widget addButton() {
    return Container(
      width: 357,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${total == null ? widget.foodPrice.toString() : total}',
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 20),
              ),
              // Text(
              //   // '\$${widget.foodPrice.toString()}',
              //   style: TextStyle(
              //       color: Theme.of(context).accentColor,
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold),
              // ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffebfcfe),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 35,
                width: 95,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Theme.of(context).accentColor,
                        ),
                        onPressed: () {
                          setState(() {
                            if (value > 1) {
                              value--;
                              total = widget.foodPrice * value;
                            }
                          });
                        },
                      ),
                    ),
                    Text(
                      '${value.toString()}',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).accentColor,
                        ),
                        onPressed: () {
                          setState(() {
                            value++;
                            total = widget.foodPrice * value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget fristRow() {
    return Container(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 380,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Weight',
                  style: TextStyle(fontSize: 20, color: Color(0xffc1c7ca)),
                ),
                Text(
                  'Max together',
                  style: TextStyle(fontSize: 20, color: Color(0xffc1c7ca)),
                ),
              ],
            ),
          ),
          // SizedBox(height: 2,),
          Container(
            width: 387,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '120kg',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'milk, eggs, dip',
                  style: TextStyle(fontSize: 20, color: Color(0xffc1c7ca)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget secoundRow() {
    return Container(
      height: 60,
      width: 390,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Colories',
                style: TextStyle(fontSize: 17, color: Color(0xffc1c7ca)),
              ),
              Text(
                'chicken in this',
                style: TextStyle(fontSize: 20, color: Color(0xffc1c7ca)),
              ),
            ],
          ),
          Container(
            width: 332,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '430 ccal',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'mixture',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffc1c7ca),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.foodName,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.foodType,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            addButton(),
                            fristRow(),
                            secoundRow(),
                          ],
                        ),
                      ),
                      Container(
                        height: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            RasiedButton(
                              textColors: Colors.white,
                              colors: Theme.of(context).primaryColor,
                              buttonText: 'Submit',
                              whenPrassed: () {
                                provider.addCartProduct(
                                  foodQuantity: value,
                                  foodImage: widget.foodImage,
                                  foodName: widget.foodName,
                                  foodPrice:
                                      total == null ? widget.foodPrice : total,
                                  foodType: widget.foodType,
                                );
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2 + 50,
                color: Color(0xffd7eef5),
                child: ListTile(
                  leading: IconButton(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 70),
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage: NetworkImage(widget.foodImage),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
