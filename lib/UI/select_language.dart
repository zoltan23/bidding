import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {

  var selectedLanguage = '1';

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return Row(
      children: <Widget>[
        Icon(Icons.language,
        color: Color.fromRGBO(30, 30, 30, 1),),
        SizedBox(width: 8.0),
        DropdownButton<String>(
                // icon: Icon(Icons.language),
                // iconSize: 24.0,
                // iconEnabledColor: Color.fromRGBO(30, 30, 30, 1),            
            items: [
              DropdownMenuItem(
              value: "1",
              child: Text(
                "EN",
              ),
              ),
              DropdownMenuItem(
              value: "2",
              child: Text(
                "ES",
              ),
              ),
            ],
            onChanged: (newValue) {
              setState(() {
              if (newValue == '1') {
                data.changeLocale(Locale("en", "US"));
                selectedLanguage = newValue;
              } else if(newValue =='2') {
                data.changeLocale(Locale("es", "MX"));
                selectedLanguage = newValue;
              }
              });
            },
            value: selectedLanguage,
          ),
      ],
    );
  }
}

