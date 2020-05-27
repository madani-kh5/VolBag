import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/homeApp/home.dart';
import 'package:principalHackathon/screens/register.dart';
import 'package:principalHackathon/services/auth.dart';
import 'package:principalHackathon/services/database.dart';
import 'package:principalHackathon/shared/loading.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {


    final ServiceAuth _auth= ServiceAuth();
    final ServiceDatabase _data=ServiceDatabase();

  // for form validate
  final _formKey=GlobalKey<FormState>();
  bool loading=false;
  //text field state
  String email;
  String password;
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
    
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Text('Se Connecter',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: Container(),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                 return Register();
               }));
             },
            child: Text("S'enregister",style: TextStyle(color: Colors.black),) 
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/help.png",height: 100,width: 100,),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(bottom: 10,top: 20,left: 30,right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     TextFormField(
                       validator: (val)=> val.isEmpty ? "Entrez un Email" : null,
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
                        validator: (val)=> val.length <6  ? "Le mot de passe doit etre 6+" : null,
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
                        child: Text("Se connecter",style: TextStyle(color: Colors.white,fontSize: 16),),
                        onPressed: ()async{
                          if(_formKey.currentState.validate()){
                            setState(() => loading=true );
                              dynamic result= await _auth.signInWithEmail(email,password);
                              if(result == null){
                                setState(() {
                                  error=true;
                                  setState(() {
                                    loading=false;
                                  });
                                  //print(error);
                                });
                              }else{
                              print("sign in correctly");
                               var userData =await _data.getUser(result.uid);
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                return Home();
                              }));
                              }
                            }     

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