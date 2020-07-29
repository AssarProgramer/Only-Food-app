import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fajira_grosery/model/food.dart';
import 'package:flutter/material.dart';

class CloudFirestoreSearch extends StatefulWidget {
  @override
  _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
}

class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
  String name = "";
  Food food;
  var search;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != '' && name != null)
            ? Firestore.instance
                .collection('Food')
                .where("foodName", arrayContains: name)
                .snapshots()
            : Firestore.instance
                .collection("Food")
                .where('foodName')
                .snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.documents[index];

                    // String name = '';
                    // // MyProvider provider = Provider.of<MyProvider>(context);

                    return Column(
                      children: <Widget>[
                        Card(
                          child: Row(
                            children: <Widget>[
                              Image.network(
                                data['foodImage'],
                                width: 150,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                data['foodName'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}
