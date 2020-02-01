import 'package:flutter/material.dart';

class Practice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "My Application",
    home: Scaffold(
      appBar: AppBar(title: Text("My Application", textDirection: TextDirection.ltr,),),
      body: RaisedButton(
        
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        onPressed: () {},
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(80.0))
          ),
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Text(
              'Click Me',
              style: TextStyle(fontSize: 20,)
          ),
        ),
      )
      ),
    );
  }
}