import 'package:flutter/material.dart';
import 'package:hello_world/ListBuilder/firebase_crud.dart';
import 'package:hello_world/services/auth.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'package:hello_world/models/user.dart';
import 'package:provider/provider.dart';

fs.Firestore firestore = fb.firestore();
fs.CollectionReference ref = firestore.collection('users');

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String error = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder(
        stream: firestore.collection('users').onSnapshot,
        builder: (context, snapshot) {
          print(firestore.collection('users').doc('Z3QdUr36aqTqCqRJYUKy').get());
    
          var firstName = snapshot.data.docs[0].get('firstName');
          var lastName = snapshot.data.docs[0].get('lastName');
          //var email = user.email;
          var email = "placeholder@.com";

          print('titleField $firstName');
          return Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              title: Text('Settings'),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Card(
                color: Color.fromRGBO(255, 255, 225, 1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                child: Form(
                  key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Align(
                                    alignment: Alignment(-.98, .95),
                                    child:
                                        SizedBox(child: Text("First Name")))),
                            Expanded(
                                child: Align(
                                    alignment: Alignment(-.96, .95),
                                    child: SizedBox(child: Text("Last Name")))),
                          ],
                        ),

                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                  initialValue: '$firstName',
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(8.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    hintText: "First Name",
                                    errorStyle: TextStyle(color: Colors.red),
                                  ),
                                  validator: (val) => val.isEmpty
                                      ? 'Enter a valid first name.'
                                      : null,
                                  onChanged: (val) {
                                    // setState(() => firstName = val.trim());
                                    setState(() {
                                      firstName = val.trim();
                                      print(firstName);
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: TextFormField(
                                  initialValue: '$lastName',
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(8.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    hintText: "Last Name",
                                    errorStyle: TextStyle(color: Colors.red),
                                  ),
                                  validator: (val) => val.isEmpty
                                      ? 'Enter a valid last name.'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => lastName = val.trim());
                                  }),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60.0,
                          child: Align(
                              alignment: Alignment(-.99, .95),
                              child: Text("Email")),
                        ),

                        //Email
                        TextFormField(
                            initialValue: '$email',
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              contentPadding: const EdgeInsets.all(8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintText: "Email",
                              errorStyle: TextStyle(color: Colors.red),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'Enter a valid email.' : null,
                            onChanged: (val) {
                              setState(() => email = val.trim());
                            }),
                        SizedBox(height: 20.0),
                        RaisedButton(
                          textColor: Colors.white,
                          padding: EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              ref.doc('1LCjeYV8pfzfQgw9gN6H').update(data: {
                                'firstName': 'updated desc',
                                'lastName': 'Updated Title',
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80.0))),
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Center(
                              child: Text('Update Settings',
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        SizedBox(
                          child: Text("Or Sign In Using"),
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.face,
                                  size: 40.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
