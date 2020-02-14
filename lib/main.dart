import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as Firebase;
import 'package:hello_world/Login/auth_wrapper.dart';
import 'package:hello_world/models/user.dart';
import 'package:hello_world/services/auth.dart';
import 'Routing/route_generator.dart';
import './services/firebase_init.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
//import 'package:i18n_easy_localization/page2.dart';


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
  runApp(EasyLocalization(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
          child: StreamProvider<User>.value(
          value: AuthService().user,
          child: MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          //app-specific localization
          EasyLocalizationDelegate(
              locale: data.locale,
              path: 'langs'),
            ],
            supportedLocales: [Locale('en', 'US'), Locale('es', 'MX')],
            locale: data.savedLocale,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
            home: AuthWrapper(),
          ),
      ),
    );
  }
}