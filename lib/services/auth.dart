import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, email: user.email) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  Future getCurrentUser() async {
    try {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      print(user);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      print(result);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.code);
      return error.toString();
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print(result);
      return result;
    } catch(error)  {
      print(error);
      return error.toString();
    }
  }

Future sendPasswordResetEmail(String email) async {
   try {
     await _auth.sendPasswordResetEmail(email: email);
   } catch(e){
     print(e);
   }
 }

  // sign out
  Future signOut() async {
    try{
     return await _auth.signOut();
    } catch(e) {
      print(e);
      return null;
    }
  }
}