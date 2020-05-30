import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/login.dart';
import 'package:principalHackathon/services/auth.dart';
import 'package:principalHackathon/services/mapLocal.dart';
import 'package:principalHackathon/shared/bottomBar.dart';
// la page principale de notre emergency map , carte d'urgence 
class HomeEm extends StatefulWidget {
  @override
  _HomeEmState createState() => _HomeEmState();
}

class _HomeEmState extends State<HomeEm> {
   ServiceAuth _auth=new ServiceAuth();
  //Color(0xFFda5868)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async{
              await _auth.signOut();
               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return Login();
              }));
            },  
            icon: Icon(Icons.person,color: Colors.white), 
            label:Text("Déconnexion",style: TextStyle(color: Colors.white),) 
            ),
            
        ],
        title: Text("carte d'urgence",textAlign: TextAlign.center,),
        centerTitle: true,

      ),
      body: Container(
        color: Colors.redAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                
                 Container(

                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                  child: Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.help,color:Colors.redAccent),
                      Text("situation\n d'urgence\n1",textAlign: TextAlign.center,style: TextStyle(color:Colors.redAccent),)
                    ],
                  ),
                ),
                 Container(
                  
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                  child: Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.pin_drop,color:Colors.redAccent),
                      Text("etre\n volontaire\n4",textAlign: TextAlign.center,style: TextStyle(color:Colors.redAccent),)
                    ],
                  ),
                  
                ),

                Container(
                  
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                  child: Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.perm_device_information,color:Colors.redAccent),
                      Text("participati\n totale \n 5",textAlign: TextAlign.center,style: TextStyle(color:Colors.redAccent),)
                    ],
                  ),
                ),
              ],
            ),
            
            Padding(padding: EdgeInsets.only(bottom: 40)),
         
            //  d'utilisation de notre google map
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                color: Colors.white,
                height:350,
                child: MapLocal(),
              ),
            ),
          ],
        ),
      ),
    bottomNavigationBar: BottomBarVol(),
      
      /*floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor:Color(0xFFda5868) ,
        child: Icon(Icons.home,color: Colors.white,),
      ),*/
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}