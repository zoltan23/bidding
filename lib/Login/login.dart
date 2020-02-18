import 'package:flutter/material.dart';
import 'package:hello_world/services/auth.dart';
import '../UI/select_language.dart';
import 'package:easy_localization/easy_localization.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        actions: <Widget>[
          SelectLanguage(),
        ],
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          translatedText(context, 'login.title'),
        ),
      ),
      body: Container(
        //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Card(
          color: Color.fromRGBO(255, 255, 225, 1.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0)),
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 18.0,
                    child: Align(
                      alignment: Alignment(-.99, .95),
                      child: Text(
                        translatedText(context, 'login.email'),
                      ),
                    ),
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        contentPadding: const EdgeInsets.all(8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        hintText: translatedText(context, 'login.email'),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      validator: (val) => val.isEmpty
                          ? translatedText(context, 'validation.email')
                          : null,
                      onChanged: (val) {
                        setState(() => email = val.trim());
                      }),
                  SizedBox(
                    height: 30.0,
                    child: Align(
                        alignment: Alignment(-.99, .95),
                        child:
                            Text(translatedText(context, 'login.password'))),
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        contentPadding: const EdgeInsets.all(8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        hintText: translatedText(context, 'login.password'),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      validator: (val) => val.length < 6
                          ? translatedText(context, 'validation.password')
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val.trim());
                      }),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    textColor: Colors.white,
                    padding: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/landing');
                    print(DateTime.now());
                    },
                    // onPressed: () async {
                    //   if (_formkey.currentState.validate()) {
                    //     dynamic result = await _auth
                    //         .signInWithEmailAndPassword(email, password);
                    //     if (result is String) {
                    //       print('result $result');
                    //       setState(() => error = result);
                    //     } else {
                    //       print('Signed In');
                    //       Navigator.pushNamed(context, '/landing');
                    //     }
                    //   }
                    // },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Center(
                        child: Text(translatedText(context, 'login.signIn'),
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
                  SizedBox(
                    child: gestureDetector(
                        context, 'login.forgotPassword', '/reset'),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    child:
                        Text(translatedText(context, 'login.orSignInUsing')),
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
                  Expanded(
                      child: Align(
                    alignment: Alignment(0, .85),
                    child: Text(
                      translatedText(context, 'login.orSignInUsing'),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                  gestureDetector(context, 'login.signUp', '/signup'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text toggleText(String lang) {
    return Text(lang, style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),);
  }
}

Widget gestureDetector(context, String purpose, String route) {
  return GestureDetector(
      child: Text(translatedText(context, purpose),
          style: TextStyle(
              fontSize: 18.0,
              decoration: TextDecoration.underline,
              color: Colors.blue)),
      onTap: () {
        Navigator.pushNamed(context, route);
      });
}

String translatedText(context, String json) {
  return AppLocalizations.of(context).tr(json);
} 