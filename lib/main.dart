import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as Firebase;
import 'package:hello_world/Login/auth_wrapper.dart';
import 'package:hello_world/models/user.dart';
import 'package:hello_world/sevices/auth.dart';
import 'Routing/route_generator.dart';
import './sevices/firebase_init.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  if (Firebase.apps.isEmpty) {
    print(Firebase.apps);
    Firebase.initializeApp(
        apiKey: API_KEY,
        authDomain: AUTH_DOMAIN,
        databaseURL: DATABASE_URL,
        projectId: PROJECT_ID,
        storageBucket: STORAGE_BUCKET,
        messagingSenderId: MESSAGING_SENDER_ID,
        appId: APP_ID,
        measurementId: MEASUREMENT_ID);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
          home: AuthWrapper(),
        ),
    );
  }
}