import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/medicalApp/homeMe.dart';

class WelcomeMe extends StatefulWidget {
  @override
  _WelcomeMeState createState() => _WelcomeMeState();
}

class _WelcomeMeState extends State<WelcomeMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: 270,
            child: Image.asset("assets/images/medical.png",height: 300,width: 300),
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
        color: Colors.blueAccent,
        child: Column(
          children: <Widget>[
            Text("Main Médicale\n",
              style:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,fontFamily:'')
            ),
            Text("Trouvez de l'aide médical \n à tout moment \n ",

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
                  return HomeMe();
                }));
              }, 
              child: Text("Commencer",
              style:TextStyle(color: Colors.blueAccent,fontSize: 17,),
              )
            ),)
          ],
        ),
        
      ),
    );
}

}