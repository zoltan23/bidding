import 'package:flutter/material.dart';
import 'package:hello_world/sevices/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Bidding'),
      ),
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
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val.trim());
                }),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                }),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.yellow,
                child: Text(
                  'Sign In With User Name and Password',
                  style: TextStyle(color: Colors.purple),
                ),
                onPressed: () async {
                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  if(result == null) {
                    print('error');
                    showDialog(
                    context: context,
                    builder: (_) => Alert()
                    );
                  } else {
                    print('Signed In');
                    print(result.uid);
                    Navigator.pushNamed(context, '/landing');
                  }
                },
              ),
            ],
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
        content: const Text('There was an error with your E-Mail/Password combination. Please try again.'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
             Navigator.of(context).pop();
            },
          ),
        ],
      );
  }
}