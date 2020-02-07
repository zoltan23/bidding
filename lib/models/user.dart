class User {
  final String uid, email;
  User({this.uid, this.email});
}

class UserList {
  List<Map<String, dynamic>> items;
  UserList(this.items);
}

class UserData {
  final String firstName, lastName;
  UserData({this.firstName, this.lastName});
}
