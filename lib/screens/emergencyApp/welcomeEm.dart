import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/emergencyApp/homeEm.dart';

class WelcomeEm extends StatefulWidget {
  @override
  _WelcomeEmState createState() => _WelcomeEmState();
}

class _WelcomeEmState extends State<WelcomeEm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: 270,
            child: Image.asset("assets/images/hospital.png",height: 300,width: 300),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: modifiedBottomAppBar,
          ),
        ],
      ),
    
    );
  }

  //bottom bar
Widget get modifiedBottomAppBar{
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      child: BottomAppBar(
        color: Colors.redAccent,
        child: Column(
          children: <Widget>[
            Text("carte d'urgence \n",
              style:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,fontFamily:'')
            ),
            Text('sauvez votre vie et la vie \n des autres aussi \n ',

              style:TextStyle(color: Colors.white,fontSize: 17,),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: FlatButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.all(10),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return HomeEm();
                }));
              }, 
              child: Text("Commencer",
              style:TextStyle(color: Colors.redAccent,fontSize: 17,),
              )
            ),)
          ],
        ),
        
      ),
    );
}

}

