import 'package:flutter/material.dart';
import 'package:hello_world/sevices/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Login'),
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
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60.0,
                child: Align(
                    alignment: Alignment(-.99, .95), child: Text("Email")),
              ),
              TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.people),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Email",
                    errorStyle: TextStyle(color: Colors.yellow),
                  ),
                  validator: (val) =>
                      val.isEmpty ? 'Enter a valid email.' : null,
                  onChanged: (val) {
                    setState(() => email = val.trim());
                  }),
              SizedBox(
                height: 30.0,
                child: Align(
                    alignment: Alignment(-.99, .95), child: Text("Password")),
              ),
              TextFormField(

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Password",
                    errorStyle: TextStyle(color: Colors.yellow),
                  ),
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val.trim());
                  }),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)),
                  color: Colors.yellow,
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.purple, fontSize: 18.0),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        print('error');
                        showDialog(context: context, builder: (_) => Alert());
                      } else {
                        print('Signed In');
                        print(result.uid);
                        Navigator.pushNamed(context, '/landing');
                      }
                    }
                  },
                ),
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
      content: const Text(
          'There was an error with your E-Mail/Password combination. Please try again.'),
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
