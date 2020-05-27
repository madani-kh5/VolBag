import 'package:flutter/material.dart';
import 'package:principalHackathon/services/auth.dart';

class RegisterSecond extends StatefulWidget {
  

  @override
  _RegisterSecondState createState() => _RegisterSecondState();
}

class _RegisterSecondState extends State<RegisterSecond> {
  final ServiceAuth _auth= ServiceAuth();
  //TextEditingController _email = TextEditingController();
  //TextEditingController _password = TextEditingController();

  String email;
  String password;

  List<String> allData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/help.png",height: 100,width: 100,),
              Form(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     TextFormField(
                        onChanged: (val){
                          setState(() {
                            email=val;
                          });
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Entrez Votre Adresse Email",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10)),
                          ),
                          errorBorder:OutlineInputBorder(
                            borderSide: BorderSide(color:  Colors.white),
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:  BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10)),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom:BorderSide(color: Colors.grey[300]))
                        ),
                      ),

                      TextFormField(
                        onChanged: (val){
                          setState(() {
                            password=val;
                          });
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Entrez Votre Mot de Passe",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:  BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10)  ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:   BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10)  ),
                          ),
                          errorBorder:OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                           borderRadius:  BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10)  ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:  BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10)  ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),

                      Padding(padding: EdgeInsets.only(top: 20)),

                      RaisedButton(
                        color: Color(0xFF00AEAE),
                        elevation: 0,
                        highlightElevation: 0,
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Créer",style: TextStyle(color: Colors.white,fontSize: 16),),
                        onPressed: ()async{
                    
                        }
                      )
                    ],
                  ),
                )
              )
            ],
          )
        ],

      ),
    );
  }
}