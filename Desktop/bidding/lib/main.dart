import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First Flutter App",
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is the AppBar')
        ),
        body: Center(
          child:  Text("Hello World!! This is the body!!!",
                  style: TextStyle(fontWeight: FontWeight.bold),))
      )
    );
  }
}