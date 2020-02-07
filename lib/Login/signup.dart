import 'package:flutter/material.dart';
import 'package:hello_world/services/auth.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;

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
          error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('Sign Up'),
      ),
      body: Container(
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
                              child: SizedBox(child: Text("First Name")))),
                      Expanded(
                          child: Align(
                              alignment: Alignment(-.96, .95),
                              child: SizedBox(child: Text("Last Name")))),
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
                              hintText: "First Name",
                              errorStyle: TextStyle(color: Colors.red),
                            ),
                            validator: (val) => val.isEmpty
                                ? 'Enter a valid first name.'
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
                              hintText: "Last Name",
                              errorStyle: TextStyle(color: Colors.red),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'Enter a valid last name.' : null,
                            onChanged: (val) {
                              setState(() => lastName = val.trim());
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.0,
                    child: Align(
                        alignment: Alignment(-.99, .95), child: Text("Email")),
                  ),

                  //Email
                  TextFormField(
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

                  //Choose Password
                  SizedBox(
                    height: 30.0,
                    child: Align(
                        alignment: Alignment(-.99, .95),
                        child: Text("Choose Password")),
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        contentPadding: const EdgeInsets.all(8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        hintText: "Password",
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long'
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
                        child: Text("Confirm Password")),
                  ),
                       TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        contentPadding: const EdgeInsets.all(8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        hintText: "Password",
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long'
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
                        setState(() => error = 'Passwords do not match!');
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Center(
                        child: Text('Sign Up',
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
    );
  }

  void handleSignUp() async {
    dynamic result = await _auth.registerWithEmailAndPassword(email, confirmPassword);
    if (result is String) {
      print('error $result');
      setState(() => error = result);
    } else {
      print('handleSignup $result');
      // ref.add({
      //   'firstName': '$firstName',
      //   'lastName': '$lastName',
      // });
      // setState(() {
      //   firstName = '';
      // });
    }
  }
}

