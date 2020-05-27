import 'package:firebase_auth/firebase_auth.dart';
import 'package:principalHackathon/models/user.dart';
import 'package:principalHackathon/services/database.dart';


class ServiceAuth{
  final FirebaseAuth _auth=FirebaseAuth.instance;

 

  User _fromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null ;
  }

    Stream<User> get user {
    return _auth.onAuthStateChanged
    .map(_fromFirebaseUser);
  }


  Future signInWithEmail(String email,String password) async{
    try {
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _fromFirebaseUser(user);
    }catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future RegisterEmail(String firstName,String lastName,String email,String password) async{
    try {
      AuthResult result=await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      FirebaseUser user=result.user;
      await ServiceDatabase().CreateUser(user.uid, firstName, lastName, email.trim());
      return _fromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future signOut() async{
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}