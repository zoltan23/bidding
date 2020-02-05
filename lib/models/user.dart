class User {

  final String uid;
  User({ this.uid });

}

class UserList {

  List<Map<String, dynamic>> items; 
  UserList(this.items);

}

class UserData {

  final String firstName;
  final String lastName;
  UserData({this.firstName, this.lastName});

}