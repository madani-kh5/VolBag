import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/homeApp/home.dart';
import 'package:principalHackathon/screens/homeApp/profil.dart';
import 'package:principalHackathon/screens/servicesApp/welcomeSe.dart';

class BottomBarVol extends StatefulWidget {
  @override
  _BottomBarVolState createState() => _BottomBarVolState();
}

class _BottomBarVolState extends State<BottomBarVol> {

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
            
            IconButton(icon: Icon(Icons.person), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return Profil();
              }));
            }),
            
            
          ],
        ),
        ),
      );
  }
}