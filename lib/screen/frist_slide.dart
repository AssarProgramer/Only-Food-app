import 'package:fajira_grosery/screen/login_page.dart';
import 'package:fajira_grosery/widgets/rasied_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class FristSlide extends StatefulWidget {
  @override
  _FristSlideState createState() => _FristSlideState();
}

class _FristSlideState extends State<FristSlide> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 850,
          child: Carousel(
            dotSize: 5.0,
            dotSpacing: 35.0,
            dotColor: Colors.white,
            indicatorBgPadding: 5.0,
            borderRadius: true,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 300),
            dotIncreasedColor: Colors.red,
            dotBgColor: Colors.transparent,
            dotPosition: DotPosition.bottomCenter,
            dotVerticalPadding: 5.0,
            showIndicator: true,
            images: [
              Image.asset(
                'images/image11.jpeg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'images/image.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'images/images3.jpg',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RasiedButton(
                colors: Theme.of(context).primaryColor,
                textColors: Colors.white,
                buttonText: 'Sikp',
                whenPrassed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
