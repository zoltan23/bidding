import 'package:flutter/material.dart';

List<String> items = [
  // Football(firstName: 'Joe', position: 'QB', college: 'LSU' ),
  // Football(firstName: 'Ed', position: 'Head Coach', college: 'LSU' ),
  // Football(firstName: 'Steve', position: 'Coordinator', college: 'LSU' )
  'football1',
  'football2',
  'football3'
];

class ListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    shrinkWrap: true,
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          //onTap: () {},
          title: Text(items[index]),
        ),
      );
    });
  }
}
