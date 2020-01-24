import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final databaseReference = Firestore.instance;
  
List<String> items = [];

void createRecord() async {
  await databaseReference.collection("books")
      .document("1")
      .setData({
        'title': 'Mastering Flutter',
        'description': 'Programming Guide for Dart'
      });

  DocumentReference ref = await databaseReference.collection("books")
      .add({
        'title': 'Flutter in Action',
        'description': 'Complete Programming Guide to learn Flutter'
      });
  print(ref.documentID);
}

void getData() {
  //print(databaseReference.collection("books"));
  databaseReference
      .collection("books")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) => items.add('${f.data}}'));
  });
}

class FirestoreData extends StatelessWidget {
  
  @override
     Widget build(BuildContext context) {
       return Center(
          child: Column(
         mainAxisSize: MainAxisSize.min,   
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          RaisedButton(
            child: Text('Create Record'),
            onPressed: () {
              createRecord();
            },
          ),
          RaisedButton(
            child: Text('View Record'),
            onPressed: () {
              getData();
            },
          ),
        ],
      ));
}
}


