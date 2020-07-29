import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

SearchBar searchBar;
GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class DisplayCourse extends StatefulWidget {
  @override
  _DisplayCourseState createState() => new _DisplayCourseState();
}

AppBar _buildAppBar(BuildContext context) {
  return new AppBar(
    title: new Text("FIREBASE QUERY"),
    centerTitle: true,
    actions: <Widget>[
      searchBar.getSearchAction(context),
    ],
  );
}

class _DisplayCourseState extends State<DisplayCourse> {
  String _queryText;

  _DisplayCourseState() {
    searchBar = new SearchBar(
      onSubmitted: onSubmitted,
      inBar: true,
      buildDefaultAppBar: _buildAppBar,
      setState: setState,
    );
  }

  void onSubmitted(String value) {
    setState(() {
      _queryText = value;
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text('You have Searched something!'),
        backgroundColor: Colors.black,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: searchBar.build(context),
      backgroundColor: Colors.red,
      body: _fireSearch(_queryText),
    );
  }
}


Widget _fireSearch(String queryText) {
  return  StreamBuilder(
    stream: Firestore.instance
        .collection('Food')
        .where('MHO1ZqiTw2TtAzLs66KT', isEqualTo: queryText)
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return  Text('Loading...');
      return  ListView.builder(
        itemCount: snapshot.data.documents.length,
        itemBuilder: (context, index) =>
            _buildListItem(snapshot.data.documents[index]),
      );
    },
  );
}

Widget _buildListItem(DocumentSnapshot document) {
  return Card(
    child: Row(
      children: <Widget>[
        Image.network(
          document['foodImage'],
          width: 150,
          height: 100,
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: 25,
        ),
        Text(
          document['foodName'],
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
