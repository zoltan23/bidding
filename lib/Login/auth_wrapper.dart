import 'package:flutter/material.dart';
import 'package:hello_world/Landing/landing_page.dart';
import 'package:hello_world/Login/login.dart';
import 'package:hello_world/models/user.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    //print('authwrapper $user');
    
    // return either the Home or Authenticate widget
    if (user == null){
      return SignIn();
    } else {
      return HomePage();
    }
  }
}