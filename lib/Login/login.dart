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

  _onTapImage(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.network('https://via.placeholder.com/150',fit: BoxFit.contain,), // Show your Image
        Align(
          alignment: Alignment.topRight,
          child: RaisedButton.icon(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              label: Text('Close')),
        ),
      ],
    );
  }

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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => Alert(),
                  );

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
        content: const Text('Are you sure you want to login?'),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
             Navigator.pushNamed(context, '/landing');
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
             Navigator.of(context).pop();
            },
          ),
        ],
      );
  }
}

