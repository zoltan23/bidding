import 'package:flutter/material.dart';
import 'package:hello_world/Landing/landing_page.dart';
import 'package:hello_world/Login/signup.dart';
import 'package:hello_world/sevices/upload/file_upload.dart';
import '../Login/login.dart';
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
      case '/firebase':
        return MaterialPageRoute(builder: (_) => FirestoreData());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/upload':
        return MaterialPageRoute(builder: (_) => FileUpload());
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


