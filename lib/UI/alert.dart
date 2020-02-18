import 'package:flutter/material.dart';


//showDialog(context: context, builder: (_) => Alert());

class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Congratulations!'),
      content: const Text(
          'You have been successfully registered!'),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.pushNamed(context, '/signin');
          },
        ),
      ],
    );
  }
}