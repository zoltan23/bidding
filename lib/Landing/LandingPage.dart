import 'package:flutter/material.dart';
import '../ListBuilder/firebase_crud.dart';
import '../ListBuilder/listbuilder.dart';

List<Widget> pageChildren(double width, context) {
  return <Widget>[
    Container(
      width: width,
      child: Column(     
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Website \nDevelopers',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.white),
          ),
          Text(
            "We have taken on a fun project",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          MaterialButton(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            onPressed: () {

showModalBottomSheet(context: context, builder: (builder) {
      return Container(
        child: Text('Hello From Modal Bottom Sheet'),
        padding: EdgeInsets.all(40.0),
      );
    });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text('Modal',
                  style: TextStyle(
                    fontSize: 16.0,
                  )),
            ),
          ),
          FirestoreData(),
          ListItems(),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Image.asset('assets/images/lp_image.png', width: width),
    ),
  ];
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2, context),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width, context),
          );
        }
      },
    );
  }
}
