import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  bool searchState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !searchState
            ? Text('Search')
            : TextField(
                decoration: InputDecoration(
                  hintText: 'Search....',
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                onChanged: (text) {},
              ),
        actions: <Widget>[
          !searchState
              ? IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(
                      () {
                        searchState = !searchState;
                      },
                    );
                  },
                )
              : IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(
                      () {
                        searchState = !searchState;
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }
}
