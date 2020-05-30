import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/homeApp/community.dart';
import 'package:principalHackathon/screens/homeApp/home.dart';
import 'package:principalHackathon/screens/homeApp/profil.dart';
import 'package:principalHackathon/services/auth.dart';
import 'package:principalHackathon/services/database.dart';

// c'est la barre de navigation de toutes les interfaces de notre application

//en vrai on a 5 bouton dans cette barre mais pour économiser le temps vu qu'on en n'a pas beaucoup en à choisi 3 pour le code 

class BottomBarVol extends StatefulWidget {
  @override
  _BottomBarVolState createState() => _BottomBarVolState();
}

class _BottomBarVolState extends State<BottomBarVol> {
  final ServiceAuth _auth=ServiceAuth();
  final ServiceDatabase _data=ServiceDatabase();
  @override
  Widget build(BuildContext context) {
      return   BottomAppBar(
        shape:CircularNotchedRectangle(),
        child: Container(
          height: 70,
           child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // le premier bouton c'est le bouton qui concerne la communauté 
            IconButton(icon: Icon(Icons.people), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return Community();
              }));
            }),
            
            // le 2eme concerne la page ou l'interface principale
            CircleAvatar(
              maxRadius:30,
              child:IconButton(icon: Icon(Icons.home,color: Colors.white), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return Home();
              }));
            }),
              backgroundColor:Color(0xFF00AEAE)
            ),
            // et la derniere c'est pour le profile de l'utilisateur 
            IconButton(icon: Icon(Icons.person), onPressed: ()async{             
              var id=await _auth.getCurrentUser();
              var userData =await _data.getUser(id);
              print(userData);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return Profil([userData['firstName'],userData['lastName'],userData['email']]);
              }));
            }),
            
            
          ],
        ),
        ),
      );
  }
}