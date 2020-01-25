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
                  } else {
                    print('Signed In');
                    print(result.uid);
                  }
                Navigator.pushNamed(context, '/landing');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SignIn extends StatefulWidget {
//   @override
//   _SignInState createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

// //  final AuthService _auth = AuthService();

//   String email = '';
//   String password = '';
//   String error = '';

//   @override
//   Widget build(BuildContext context) {
//     final emailField = TextField(
//       obscureText: false,
//       style: style,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//           hintText: "Email",
//           border:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//       onChanged: (val) {
//         setState(() => email = val);
//       },
//     );
//     final passwordField = TextField(
//       obscureText: true,
//       style: style,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//           hintText: "Password",
//           border:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//       onChanged: (val) {
//         setState(() => password = val);
//       },
//     );
//     final loginButon = Material(
//       elevation: 5.0,
//       borderRadius: BorderRadius.circular(30.0),
//       color: Color(0xff01A0C7),
//       child: MaterialButton(
//         minWidth: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//         // onPressed: () async {
//         //   dynamic result = await _auth.signInWithEmailAndPassword(email, password);
//         //   if (result == null) {
//         //     setState(() => error = 'Invalid creds');
//         //   } else {
//         //     print('signed in');
//         //     print(result);
//         //   }
//         onPressed: () {
//           print('Pressed');
//         },
//         child: Text("Login",
//             textAlign: TextAlign.center,
//             style: style.copyWith(
//                 color: Colors.white, fontWeight: FontWeight.bold)),
//       ),
//     );

//     return Scaffold(
//       body: Center(
//         child: Container(
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.all(36.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(
//                   height: 155.0,
//                   child: Image.asset(
//                     "assets/logo.png",
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 SizedBox(height: 45.0),
//                 emailField,
//                 SizedBox(height: 25.0),
//                 passwordField,
//                 SizedBox(
//                   height: 35.0,
//                 ),
//                 loginButon,
//                 SizedBox(
//                   height: 15.0,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
