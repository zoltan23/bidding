import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'listbuilder.dart';
import '../Navbar/navbar.dart';

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
  User user = User(docs);
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

class FirestoreData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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

// class FirestoreData extends StatelessWidget {
//   @override
//      Widget build(BuildContext context) {
//        return Center(
//           child: Column(
//          mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           RaisedButton(
//             child: Text('Create Record'),
//             onPressed: () {
//               createRecord();
//             },
//           ),
//           RaisedButton(
//             child: Text('View Record'),
//             onPressed: () {
//               getData();
//             User user = User(items);
//             Navigator.push(context, MaterialPageRoute(
//               builder: (context) => ListItems(user: user
//               )));
//             },
//           ),
//           RaisedButton(
//             child: Text('Delete Record'),
//             onPressed: () {
//               deleteRecord();
//             },
//           ),
//           RaisedButton(
//             child: Text('Update Record'),
//             onPressed: () {
//               updateRecord();
//             },
//           ),
//               StreamBuilder(
//               stream: userLinks(firestore),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData)
//                   return CircularProgressIndicator();
//                 else
//                   return Container(
//                     width: 500,
//                     //width: width > 698 ? width / 3 : width,
//                     child: Column(
//                       children: <Widget>[
//                         for(var link in snapshot.data)
//                           Text(link.toString(),
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16.0),),
//                       ],
//                     ),
//                   );
//               },
//             ),
//         ],
//       ));
// }
// }

Stream<List<Map<String, dynamic>>> userLinks(fs.Firestore firestore) {
  return firestore
      .collection('books')
      .onSnapshot
      .map((data) => data.docs.map((doc) => doc.data()).toList());
}


