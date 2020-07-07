import 'package:fajira_grosery/widgets/rasied_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/myprovider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  MyProvider provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<MyProvider>(context, listen: false);

    var getTotalPrice = provider.allCartProduct;
    getTotalPrice.forEach(
      (element) {
        foodTotalPrice += element.foodPrice;
      },
    );
  }

  double foodTotalPrice = 0.0;
  Widget cartContainer(BuildContext context, int index) {
    var allCartProduct = provider.allCartProductList;
    return Dismissible(
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Delete'),
              content: Text('Are you sure ?'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    // Navigator.pop(context, false);
                    Navigator.of(
                      context,
                      // rootNavigator: true,
                    ).pop(false);
                  },
                  child: Text('No'),
                ),
                FlatButton(
                  onPressed: () {
                    // Navigator.pop(context, true);
                    Navigator.of(
                      context,
                      // rootNavigator: true,
                    ).pop(true);
                  },
                  child: Container(
                    height: 40,
                    width: 70,
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      key: UniqueKey(),
      direction: DismissDirection.horizontal,
      crossAxisEndOffset: 0.9,
      onDismissed: (direction) {
        provider.deteleCartFood(
          index,
        );
        // var getTotalPrice = provider.allCartProduct;

        foodTotalPrice -= allCartProduct[index].foodPrice;

        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).primaryColor,
            content: Text(
              'Yesh Delete kr De Bhai',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
      // background: Container(
      //   padding: const EdgeInsets.only(right: 20.0),
      //   alignment: Alignment.centerRight,
      //   child: Icon(
      //     Icons.delete,
      //     size: 32.0,
      //     color: Theme.of(context).accentColor,
      //   ),
      // ),
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 13),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(allCartProduct[index].foodImage),
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
                    '${allCartProduct[index].foodQuantity}x',
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
                          '${allCartProduct[index].foodName}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          '${allCartProduct[index].foodType}',
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
                  '\$${allCartProduct[index].foodPrice}',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomPart() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                  '\$$foodTotalPrice',
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
    );
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MyProvider>(context);

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
              child: ListView.builder(
                itemBuilder: cartContainer,
                itemCount: provider.cartProductList,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: bottomPart(),
          ),
        ],
      ),
    );
  }
}
