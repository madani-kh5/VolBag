import 'dart:async';
import 'package:flutter/material.dart';
import 'package:principalHackathon/models/user.dart';
import 'package:principalHackathon/screens/homeApp/home.dart';
import 'package:principalHackathon/screens/sliderView.dart';
import 'package:provider/provider.dart';

// c'est la page de lancement de notre application
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), ()=>{
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
        final user=Provider.of<User>(context);
        if(user == null){
        return SliderView();
        }else{
          return Home();
        }
      }))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex:3 ,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     /*CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Icon(Icons.people,size: 50),
                      ),*/
                      Container(
                        height: 300,
                        width: 300,
                        child: Image.asset("assets/images/help.png"),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text("VolBag",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),

              Expanded(
                flex:1 ,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top : 20)),
                    Text("Application Pour\nTout Type de Volontariat",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)

                  ],
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}