import 'package:flutter/material.dart';
import 'package:hello_world/models/user.dart';
import 'package:hello_world/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopNavbar();
      } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
        return DesktopNavbar();
      } else {
        return MobileNavbar();
      }
    });
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    var data = EasyLocalizationProvider.of(context).data;
    print('[navbar] user $user');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
            Text(
              'Retroportal Studio',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    translatedText(context, 'navbar.home'),
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
                    child: Text(
                      translatedText(context, 'navbar.crud'),
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/firebase');
                    }),
                SizedBox(width: 30),
                RaisedButton(
                  child: Text(
                    translatedText(context, 'navbar.settings'),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  child: Text(
                    translatedText(context, 'navbar.signOut'),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    await AuthService()
                        .signOut()
                        // .then((value) => showDialog(
                        //     context: context, builder: (_) => Alert()))
                        .then((_) => {Navigator.pushNamed(context, '/signin')});
                  },
                ),
              ],
            )
          ])),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    translatedText(context, 'navbar.home'),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  child: Text(
                    translatedText(context, 'navbar.crud'),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/firebase');
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  child: Text(
                    translatedText(context, 'navbar.settings'),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  child: Text(
                    translatedText(context, 'navbar.signOut'),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    await AuthService()
                        .signOut()
                        // .then((value) => showDialog(
                        //     context: context, builder: (_) => Alert()))
                        .then((_) => {Navigator.pushNamed(context, '/signin')});
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

String translatedText(context, String json) {
  return AppLocalizations.of(context).tr(json);
}

class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitRotatingCircle(
      duration: Duration(milliseconds: 3000),
  color: Colors.white,
  size: 50.0,
);
    // return AlertDialog(
    //   title: Text('Congratulations!'),
    //   content: const Text('You have been successfully signed out!'),
    //   actions: <Widget>[
    //     FlatButton(
    //       child: Text('Ok'),
    //       onPressed: () {
    //         Navigator.pushNamed(context, '/signin');
    //       },
    //     ),
    //   ],
    // );
  }
}
