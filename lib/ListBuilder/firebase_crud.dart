import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'listbuilder.dart';
import '../Navbar/navbar.dart';
import '../models/user.dart';
import 'listbuilder.dart';

fs.Firestore firestore = fb.firestore();
fs.CollectionReference ref = firestore.collection('books');

List<Map<String, dynamic>> docs = [];

void createRecord() async {
  ref.add({
    'description': 'this is a description',
    'title': 'It is working now!!!!'
  });
}

void getData(context) async {
  docs = await firestore
      .collection('books')
      .get()
      .then((data) => data.docs.map((doc) => doc.data()).toList());
  print(docs);
  UserList user = UserList(docs);
  print(user);
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ListItems(user: user)));
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

  // UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return UserData(
  //     uid: uid,
  //     firstName: snapshot.data['firstName'],
  //   );
  // }


class FirestoreData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(195, 20, 50, 1.0),
                Color.fromRGBO(36, 20, 50, 1.0)
              ]),
        ),
        child: Column(
          children: <Widget>[
            Navbar(),
            RaisedButton(
              child: Text('Create Record'),
              onPressed: () {
                createRecord();
              },
            ),
            RaisedButton(
              child: Text('View Record'),
              onPressed: () {
                getData(context);
                //User user = User(docs);
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
        ),
      ),
    );
  }
}

Stream<List<Map<String, dynamic>>> userLinks(fs.Firestore firestore) {
  return firestore
      .collection('books')
      .onSnapshot
      .map((data) => data.docs.map((doc) => doc.data()).toList());
}


