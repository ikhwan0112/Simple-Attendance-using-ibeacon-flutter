import 'package:beaconapplication/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User _user = User();

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
    .map((_userFromFirebaseUser));
  }
  // sign in anon
  Future signInAnon() async{
    try{
           AuthResult result = await _auth.signInAnonymously();
           FirebaseUser user = result.user;
           return _userFromFirebaseUser(user);
    }
    catch(e){
       print(e.toString());
       return null;
    }
  }
  //sign in email * password

  //registr with email & password

  //sign out
}