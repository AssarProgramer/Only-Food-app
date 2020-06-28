import 'package:flutter/material.dart';

class FeaturedContainer extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final double foodRating;
  final String foodType;
  final double foodPrice;
  final Function whenPreesd;
  FeaturedContainer({
    this.foodImage,
    this.foodName,
    this.foodPrice,
    this.foodType,
    this.foodRating,
    this.whenPreesd,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: GestureDetector(
            onTap: whenPreesd,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              width: 190,
              height: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 70,
                        ),
                        Text(
                          foodName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          foodType,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.yellow[700],
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            // SizedBox(),
                            Text(
                             ' ${foodRating.toString()} Rating',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '\$${foodPrice.toString()}',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 90,
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              foodImage,
            ),
            maxRadius: 65,
          ),
        ),
      ],
    );
  }
}
