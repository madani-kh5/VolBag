import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/servicesApp/homeSe.dart';

class WelcomeSe extends StatefulWidget {
  @override
  _WelcomeSeState createState() => _WelcomeSeState();
}

class _WelcomeSeState extends State<WelcomeSe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: 270,
            child: Image.asset("assets/images/service.png",height: 300,width: 300),
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







  Widget get modifiedBottomAppBar{
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      child: BottomAppBar(
        color: Colors.orangeAccent,
        child: Column(
          children: <Widget>[
            Text("Mains\n de la Communauté \n",textAlign: TextAlign.center,
              style:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,fontFamily:'')
            ),
            Text('donnez des services \n et recevez aussi \n ',

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
                  return HomeSe();
                }));
              }, 
              child: Text("Commencer",
              style:TextStyle(color: Colors.orangeAccent,fontSize: 17,),
              )
            ),)
          ],
        ),
        
      ),
    );
}
}