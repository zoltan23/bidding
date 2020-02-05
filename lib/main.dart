import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as Firebase;
import 'Routing/route_generator.dart';
import './sevices/firebase_init.dart';

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
        measurementId: MEASUREMENT_ID
        );
}
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}