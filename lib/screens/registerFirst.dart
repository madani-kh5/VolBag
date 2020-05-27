import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/registerSecond.dart';

class RegisterFirst extends StatefulWidget {
  @override
  _RegisterFirstState createState() => _RegisterFirstState();
}

class _RegisterFirstState extends State<RegisterFirst> {

  String firstname;
  String lastname;
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
                      Row(
                        children: <Widget>[
                          Flexible(child:
                            TextFormField(
                                onChanged: (val){
                                  setState(() {
                                    lastname=val;
                                  });
                                },
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Nom",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:Radius.circular(10)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:Radius.circular(10)),
                                  ),
                                  errorBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color:  Colors.white),
                                    borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:Radius.circular(10)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:  BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:Radius.circular(10)),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                )
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border(left:BorderSide(color: Colors.grey[300]))
                                ),
                              ),


                            Flexible(child:
                            TextFormField(
                                onChanged: (val){
                                  setState(() {
                                    firstname=val;
                                  });
                                },
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Prénom",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.only(topRight:Radius.circular(10),bottomRight:Radius.circular(10)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.only(topRight:Radius.circular(10),bottomRight:Radius.circular(10)),
                                  ),
                                  errorBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color:  Colors.white),
                                    borderRadius: BorderRadius.only(topRight:Radius.circular(10),bottomRight:Radius.circular(10)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:  BorderRadius.only(topRight:Radius.circular(10),bottomRight:Radius.circular(10)),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                )
                              ),




                        ],
                      ),

                      Padding(padding: EdgeInsets.only(top: 30)),

                      RaisedButton(
                        color: Color(0xFF00AEAE),
                        elevation: 0,
                        highlightElevation: 0,
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Suivant",style: TextStyle(color: Colors.white,fontSize: 16),),
                        onPressed: (){
                          /*
                          if(firstname != null && lastname != null){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                              return  RegisterSecond([firstname,lastname]);
                            }));
                          }*/
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