import 'package:flutter/material.dart';
import 'package:principalHackathon/models/user.dart';
import 'package:principalHackathon/screens/login.dart';
import 'package:principalHackathon/services/auth.dart';
import 'package:principalHackathon/shared/bottomBar.dart';

class Profil extends StatefulWidget {
  final List<String> data;
  
  Profil(this.data);
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  ServiceAuth _auth=ServiceAuth();
  List<String> userData=[];

  @override
  void initState() {
    super.initState();
    userData.addAll(widget.data);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00AEAE),
        elevation: 0,
        leading: Container(),
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
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
            height: MediaQuery.of(context).size.height * .35,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xFF00AEAE),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 70,
                  child: Text(userData[1].substring(0,1)+userData[0].substring(0,1),style: TextStyle(fontSize: 60,color: Color(0xFF00AEAE)),),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Text(userData[1].toString()+" "+userData[0].toString(),style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                Text(userData[2].toString(),style: TextStyle(fontSize: 15,color: Colors.white),textAlign: TextAlign.center),
                Padding(padding: EdgeInsets.only(bottom: 10)),            
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xFF00AEAE),
                        elevation: 0,
                        highlightElevation: 0,
                        padding: EdgeInsets.symmetric(horizontal: 28,vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                  onPressed: (){},
                  child:Text("Mettre à jour\nVos données",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                ),
                 RaisedButton(
                   color: Color(0xFF00AEAE),
                        elevation: 0,
                        highlightElevation: 0,
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                  onPressed: ()async{
                    await _auth.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                      return Login();
                    }));
                  },
                  child:Text("Se Déconnecter",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                ),

              ],
            ),
          )
          ],
        ),
      ),


      bottomNavigationBar: BottomBarVol(),
    );
  }



}