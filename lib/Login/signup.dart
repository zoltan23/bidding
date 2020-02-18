import 'package:flutter/material.dart';
import 'package:hello_world/services/auth.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import '../UI/select_language.dart';

fs.Firestore firestore = fb.firestore();
fs.CollectionReference ref = firestore.collection('users');

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String  email = '', 
          choosePassword = '', 
          confirmPassword = '',
          firstName = '', 
          lastName = '', 
          signUpTimeStamp = '',
          error = '';

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        actions: <Widget>[
          SelectLanguage(),
        ],
        centerTitle: true,
        elevation: 0.0,
        title: Text(translatedText(context, 'signUp.title')),
      ),
      body: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Card(
            color: Color.fromRGBO(255, 255, 225, 1.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
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
                                child: SizedBox(child: Text(translatedText(context, 'signUp.firstName'))))),
                        Expanded(
                            child: Align(
                                alignment: Alignment(-.96, .95),
                                child: SizedBox(child: Text(translatedText(context, 'signUp.lastName'))))),
                      ],
                    ),

                    Row(
                      children: <Widget>[

                        //First Name
                        Expanded(
                          child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hintText: translatedText(context, 'signUp.firstName'),
                                errorStyle: TextStyle(color: Colors.red),
                              ),
                              validator: (val) => val.isEmpty
                                  ? translatedText(context, 'validation.firstName')
                                  : null,
                              onChanged: (val) {
                                setState(() => firstName = val.trim());
                              }),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hintText: translatedText(context, 'signUp.lastName'),
                                errorStyle: TextStyle(color: Colors.red),
                              ),
                              validator: (val) =>
                                  val.isEmpty ? translatedText(context, 'validation.lastName') : null,
                              onChanged: (val) {
                                setState(() => lastName = val.trim());
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60.0,
                      child: Align(
                          alignment: Alignment(-.99, .95), child: Text(translatedText(context, 'signUp.email'))),
                    ),

                    //Email
                    TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          contentPadding: const EdgeInsets.all(8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: translatedText(context, 'signUp.email'),
                          errorStyle: TextStyle(color: Colors.red),
                        ),
                        validator: (val) =>
                            val.isEmpty ? translatedText(context, 'validation.email') : null,
                        onChanged: (val) {
                          setState(() {
                            email = val.trim();
                          });
                       //   setState(() => email = val.trim());
                        }),

                    //Choose Password
                    SizedBox(
                      height: 30.0,
                      child: Align(
                          alignment: Alignment(-.99, .95),
                          child: Text(translatedText(context, 'signUp.choosePassword'))),
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          contentPadding: const EdgeInsets.all(8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: translatedText(context, 'signUp.choosePassword'),
                          errorStyle: TextStyle(color: Colors.red),
                        ),
                        validator: (val) => val.length < 6
                            ? translatedText(context, 'validation.password')
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => choosePassword = val.trim());
                        }),

                        //Confirm Password
                         SizedBox(
                      height: 30.0,
                      child: Align(
                          alignment: Alignment(-.99, .95),
                          child: Text(translatedText(context, 'signUp.confirmPassword'))),
                    ),
                         TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          contentPadding: const EdgeInsets.all(8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: translatedText(context, 'signUp.confirmPassword'),
                          errorStyle: TextStyle(color: Colors.red),
                        ),
                        validator: (val) => val.length < 6
                            ? translatedText(context, 'validation.password')
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => confirmPassword = val.trim());
                        }),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      onPressed: () {
                        if (_formkey.currentState.validate() && (choosePassword == confirmPassword)) {
                          handleSignUp();
                        } else if(choosePassword != confirmPassword) {
                          setState(() => error = translatedText(context, 'signUp.choosePassword'));
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Center(
                          child: Text(translatedText(context, 'signUp.signUp'),
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
                      child: Text(translatedText(context, 'signUp.orSignInUsing')),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.center,
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
      ),
    );
  }

  void handleSignUp() async {
    dynamic result = await _auth.registerWithEmailAndPassword(email, confirmPassword);
    if (result is String) {
      print('error $result');
      setState(() => error = result);
    } else {
      print('handleSignup user id ${result.user.uid}');
      ref.doc(result.user.uid).set({
        'firstName': '$firstName',
        'lastName': '$lastName',
        'email': '$email',
        'signUpTimeStamp': DateTime.now()  
      });
      setState(() {
        firstName = '';
      });
    }
  }
}

String translatedText(context, String json) {
  return AppLocalizations.of(context).tr(json);
}

