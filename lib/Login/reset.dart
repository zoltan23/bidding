import 'package:flutter/material.dart';
import 'package:hello_world/services/auth.dart';

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('Reset Password'),
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
                  SizedBox(
                    height: 60.0,
                    child: Align(
                        alignment: Alignment(-.99, .95), child: Text("Email")),
                  ),
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
                  SizedBox(height: 20.0),
                  RaisedButton(
                    textColor: Colors.white,
                    padding: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        dynamic result = await _auth.sendPasswordResetEmail(email);
                        if (result is String) {
                          print('result $result');
                          setState(() => error = result);
                        } else {
                          print('Password Email Sent!');
                          showDialog(context: context, builder: (_) => Alert());
                        }
                      }
                      //Navigator.pushNamed(context, '/signin');
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Center(
                        child: Text('Send Password Reset Email',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
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
}

class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Login Alert!'),
      content:  Text(
          'An email has been sent to you with password reset instructions.  Click OK to proceed to the login page.'),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
           Navigator.pushNamed(context, '/signin');
          },
        ),
      ],
    );
  }
}