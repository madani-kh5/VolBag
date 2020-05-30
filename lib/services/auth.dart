import 'package:firebase_auth/firebase_auth.dart';
import 'package:principalHackathon/models/user.dart';
import 'package:principalHackathon/services/database.dart';

// le service d'authentification de firebase , FirebaseAuth
class ServiceAuth{
  final FirebaseAuth _auth=FirebaseAuth.instance;

 

  User _fromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null ;
  }

    Stream<User> get user {
    return _auth.onAuthStateChanged
    .map(_fromFirebaseUser);
  }

  // fonction qui concerne d'authentification
  Future signInWithEmail(String email,String password) async{
    try {
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      //var userData=ServiceDatabase().getUser(user.uid);
     // print(userData);
      return _fromFirebaseUser(user);
    }catch (e) {
      print(e.toString());
      return null;
    }
  }
  // récupérer l'id de l'utilisateur connecté , dans notre on utilise cette fonction pour récupérer les données de l'utilisateur à partir de fireStore 
  // c'est pour afficher les données du profile de notre utilisateur
  Future getCurrentUser() async{
    final FirebaseUser user = await _auth.currentUser();
    return user.uid;
  }
  // fonction qui concerne l'enregistrement d'un nouvel utilisateur
  Future RegisterEmail(String firstName,String lastName,String email,String password) async{
    try {
      AuthResult result=await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      FirebaseUser user=result.user;
      // une fonction firestore pour enregistrer les données de notre utilisateur
      await ServiceDatabase().CreateUser(user.uid, firstName, lastName, email.trim());
      return _fromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // déconnexion
  Future signOut() async{
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}