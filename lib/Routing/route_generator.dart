import 'package:flutter/material.dart';
import 'package:hello_world/Landing/landing_page.dart';
import 'package:hello_world/Login/auth_wrapper.dart';
import 'package:hello_world/Login/reset.dart';
import 'package:hello_world/Login/signup.dart';
import 'package:hello_world/services/settings.dart';
import '../Login/login.dart';
import '../ListBuilder/firebase_crud.dart';
import '../HomePage/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AuthWrapper());
      case '/home':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/landing':
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/firebase':
        return MaterialPageRoute(builder: (_) => FirestoreData());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/settings':
        return MaterialPageRoute(builder: (_) => Settings());  
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignIn());  
      case '/reset':
        return MaterialPageRoute(builder: (_) => Reset());  
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


