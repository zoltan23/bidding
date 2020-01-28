import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
//import 'package:cloud_firestore/cloud_firestore.dart';

fs.Firestore firestore = fb.firestore();
fs.CollectionReference ref = firestore.collection('books');

void createRecord() async {
  ref.add({
    'description': 'this is a description',
    'title': 'It is working now!!!!'
    });
}

void  getData() async {
final docs = await firestore
        .collection('books').get()
.then((data) => data.docs.map((doc) => doc.data()).toList());
print(docs);
}

void deleteRecord() {
ref.doc('1').delete();
}

void updateRecord() {
ref.doc('1LCjeYV8pfzfQgw9gN6H').update(
  data: {
    'description': 'updated desc',
    'title': 'Updated Title',
  }
);
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
          RaisedButton(
            child: Text('Delete Record'),
            onPressed: () {
              deleteRecord();
            },
          ),
          RaisedButton(
            child: Text('Update Record'),
            onPressed: () {
              updateRecord();
            },
          ),
        ],
      ));
}
}

// THIS WORKS WITH ANDROID BUT NOT THE WEB
//final databaseReference = Firestore.instance;
  
// void createRecord() async {
//   await ref.collection("books")
//       .document("1")
//       .setData({
//         'title': 'Mastering Flutter',
//         'description': 'Programming Guide for Dart'
//       });

//   DocumentReference docRef = await ref.collection("books")
//       .add({
//         'title': 'Flutter in Action',
//         'description': 'Complete Programming Guide to learn Flutter'
//       });
//   print(ref.documentID);
// }

