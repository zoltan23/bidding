import 'package:flutter/material.dart';
import '../models/user.dart';

class ListItems extends StatelessWidget {
  final UserList user;
  ListItems({this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(195, 20, 50, 1.0), 
              Color.fromRGBO(36, 20, 50, 1.0)
              ]),
        ),
      child: ListView.builder(
      shrinkWrap: true,
      itemCount: user.items.length,
      itemBuilder: (context, index) {
        return Card(
          color: Color.fromRGBO(255, 255, 225, 1.0),
          child: ListTile(
            //onTap: () {},
            title: Text(user.items[index]['title']),
          ),
        );
      }),
    );
  }
}

