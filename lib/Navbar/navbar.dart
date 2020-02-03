import 'package:flutter/material.dart';



class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext contest) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if(constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      }
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Retroportal Studio', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                                  child: Text('Home', 
                  style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/landing');
                  },
                ),
                SizedBox(
                  width: 30,
                  ),
                RaisedButton(
                                  child: Text('CRUD', 
                  style: TextStyle(color: Colors.white),
                                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/firebase');
                  }
                ),
                 SizedBox(
                  width: 30,
                  ),
                  RaisedButton(
                                      child: Text('Settings', 
                style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                  ),
                 SizedBox(
                  width: 30,
                  ),
                  MaterialButton(
                    color: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      onPressed: () {},
                      child: Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white),
                      )
                  )
              ],
               )
          ]
        )
      ),
    );
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Column(children: <Widget>[
          Text(
            "RetroPortal Studio",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                                  child: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {

                  },
                ),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  child: Text(
                                "CRUD",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {

                  },
                ),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  child: Text(
                                "settings",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
