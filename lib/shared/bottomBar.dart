import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/homeApp/home.dart';
import 'package:principalHackathon/screens/homeApp/profil.dart';
import 'package:principalHackathon/screens/servicesApp/welcomeSe.dart';
import 'package:principalHackathon/services/auth.dart';
import 'package:principalHackathon/services/database.dart';

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
            
            IconButton(icon: Icon(Icons.people), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return WelcomeSe();
              }));
            }),
            
            
            CircleAvatar(
              maxRadius:30,
              child:IconButton(icon: Icon(Icons.home,color: Colors.white), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return Home();
              }));
            }),
              backgroundColor:Color(0xFF00AEAE)
            ),
            
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