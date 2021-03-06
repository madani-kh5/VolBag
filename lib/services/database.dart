import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:principalHackathon/models/user.dart';


class ServiceDatabase{
  final CollectionReference userCollectionRef=Firestore.instance.collection("users");
  // fonction pour l'enregistrement des données d'un nouvel utilisateur
  Future CreateUser(String uid,String firstName,String lastName,String email)async{
    try {
      await userCollectionRef.document(uid).setData({
        'uid' : uid,
        'firstName' : firstName,
        'lastName' : lastName,
        'email' : email ,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // récupérer les données de notre utilisateur à partir de son id
  Future getUser(String uid) async{
    try {
      var userData=await userCollectionRef.document(uid).get();
      return userData.data;
      //User.fromData(userData.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  
}