import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;



fs.Firestore firestore = fb.firestore();
fs.CollectionReference ref = firestore.collection('books');


void createRecord() async {
  ref.add({
    'description': 'this is a description',
    'title': 'It is working now!!!!'
  });
}

void getData(context) async {
 final docs = await firestore
      .collection('books')
      .get()
      .then((data) => data.docs.map((doc) => doc.data()).toList());
  print(docs);
}

void deleteRecord() {
  ref.doc('1').delete();
}

void updateRecord() {
  ref.doc('1LCjeYV8pfzfQgw9gN6H').update(data: {
    'description': 'updated desc',
    'title': 'Updated Title',
  });
}