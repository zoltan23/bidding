import 'package:flutter/material.dart';

class User {
  List<String> items; 
  User(this.items);
}

class ListItems extends StatelessWidget {
  final User user;
  ListItems({this.user});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    shrinkWrap: true,
    itemCount: user.items.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          //onTap: () {},
          title: Text(user.items[index]),
        ),
      );
    });
  }
}

// class HomePage extends StatelessWidget {
//   final User user;
 
//   HomePage({Key key, this.user}) : super(key: key);
 
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Page"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () {
//             Navigator.pop(context, true);
//           },
//           child: Text('Log Out ${user.userName}'),
//         ),
//       ),
//     );
//   }
// }