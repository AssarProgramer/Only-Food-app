import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestFile extends StatefulWidget {
  @override
  _TestFileState createState() => _TestFileState();
}

class _TestFileState extends State<TestFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('food').snapshots(),
        builder: (ctx, snapShort) {
          if(snapShort.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            );
          }
          final documents=snapShort.data.documents;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8),
              child: Text(documents[index]['foodName']),
            ),
          );
        },
      ),
    );
  }
}
