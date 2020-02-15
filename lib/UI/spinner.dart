import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinKit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        children: <Widget>[
          Center(
            child: SpinKitFadingCube(
              duration: Duration(seconds: 3),
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}