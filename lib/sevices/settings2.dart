import 'package:flutter/material.dart';
import 'package:hello_world/ListBuilder/firebase_crud.dart';
import 'package:hello_world/sevices/auth.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;

fs.Firestore firestore = fb.firestore();
fs.CollectionReference ref = firestore.collection('users');

class Settings2 extends StatefulWidget {
  @override
  _Settings2State createState() => _Settings2State();
}

class _Settings2State extends State<Settings2> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firestore.collection('books').onSnapshot,
      builder: (context, snapshot){
        print(snapshot.data.docs[0].get('title'));
      final titleField = snapshot.data.docs[0].get('title');
      print('titleField $titleField');
      return Scaffold(
              body: Form(
              child: Column(
                children: <Widget>[
                  // Text(
                  //   'Update your brew settings.',
                  //   style: TextStyle(fontSize: 18.0),
                  // ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: titleField.trim(),
                    validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                  ),
                ],
              ),
        ),
      );  
      },);
  }
}

// class Settings2 extends StatefulWidget {
//   @override
//   _Settings2State createState() => _Settings2State();
// }

// class _Settings2State extends State<Settings2> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(child:
//     StreamBuilder(
//       stream: firestore.collection('books').onSnapshot,
//       builder: (context, snapshot){
//         print(snapshot.data.docs[0].get('title'));
//       return ListView.builder(
//       shrinkWrap: true,
//       itemCount: snapshot.data.docs.length,
//       itemBuilder: (context, index) {
//         return Card(
//           color: Color.fromRGBO(255, 255, 225, 1.0),
//           child: ListTile(
//             //onTap: () {},
//             title: Text(snapshot.data.docs[index].get('title')),
//           ),
//         );
//       });
//       },),
//     );
//   }
// }