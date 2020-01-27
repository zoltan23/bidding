import 'package:flutter/material.dart';
import 'package:hello_world/Landing/landing_page.dart';
import '../Login/login.dart';
import '../ListBuilder/listbuilder.dart';
import '../ListBuilder/firebase_crud.dart';
import '../HomePage/home_page.dart';

class RouteGenerator {
  //String data = 'Test'; 
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/home':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/landing':
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/list':
        return MaterialPageRoute(builder: (_) => ListItems());
      case '/firebase':
        return MaterialPageRoute(builder: (_) => FirestoreData());
      // case '/second':
      //   if (args is String) {
      //     return MaterialPageRoute(
      //       builder: (_) => ListItems(
      //         //data: args,
      //         ),
      //     );
      //  }
        //return _errorRoute();
        default:
          return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('error'),
          ),
          body: Center(
            child: Text('error'),
          ),
          );
    });
}
}


