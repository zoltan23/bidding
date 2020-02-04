import 'package:flutter/material.dart';
import 'package:hello_world/carousel.dart';
import '../Navbar/navbar.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Navbar(),
              //SizedBox(height: 400.0, child: CarouselWithIndicator()),
              SizedBox(
                height: 900.0,
                child: HomePage()),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> pageChildren(double width, context) {
  return <Widget>[
    Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 575.0,
            child: CarouselWithIndicator()),
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
              showModalBottomSheet(
                  context: context,
                  builder: (builder) {
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
        ],
      ),
    ),
  ];
}

class HomePage extends StatelessWidget {
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
