import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/homeApp/home.dart';
import 'package:principalHackathon/services/auth.dart';
import 'package:principalHackathon/shared/loading.dart';
// c'est l'innterface de l'enregistrement d'un nouvel utilisateur , register
class Register extends StatefulWidget {
  

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final ServiceAuth _auth= ServiceAuth();
   final _formKey=GlobalKey<FormState>();
    bool loading=false;
    bool error=false;

  String firstname;
  String lastname;
  String email;
  String password;

  

  @override
  Widget build(BuildContext context) {

    // l'utilisation du Spinner
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.grey[200],
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
                      Row(
                        children: <Widget>[
                          Flexible(child:
                            TextFormField(
                                validator: (val)=> val.isEmpty ? "Entrez votre nom" : null,
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
                                    borderRadius: BorderRadius.only(topLeft:Radius.circular(10)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.only(topLeft:Radius.circular(10)),
                                  ),
                                  errorBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color:  Colors.white),
                                    borderRadius: BorderRadius.only(topLeft:Radius.circular(10)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:  BorderRadius.only(topLeft:Radius.circular(10)),
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
                                validator: (val)=> val.isEmpty ? "Entrez votre prénom" : null,
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
                                    borderRadius: BorderRadius.only(topRight:Radius.circular(10)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.only(topRight:Radius.circular(10)),
                                  ),
                                  errorBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color:  Colors.white),
                                    borderRadius: BorderRadius.only(topRight:Radius.circular(10)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:  BorderRadius.only(topRight:Radius.circular(10)),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                )
                              ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom:BorderSide(color: Colors.grey[300]))
                        ),
                      ),
                     TextFormField(
                       validator: (val)=> val.isEmpty ? "Entrez un Email" : null,
                        onChanged: (val){
                          setState(() {
                            email=val;
                          });
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Entrez Votre Adresse Email",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(0),topRight:Radius.circular(0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(0),topRight:Radius.circular(0)),
                          ),
                          errorBorder:OutlineInputBorder(
                            borderSide: BorderSide(color:  Colors.white),
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(0),topRight:Radius.circular(0)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:  BorderRadius.only(topLeft:Radius.circular(0),topRight:Radius.circular(0)),
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
                        validator: (val)=> val.length<6 ? "Le mot de passe doit etre 6+" : null,
                        onChanged: (val){
                          setState(() {
                            password=val;
                          });
                        },
                        textAlign: TextAlign.center,
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

                          //validation des textfields
                          if(_formKey.currentState.validate()){
                              setState(() => loading=true );
                              dynamic result= await _auth.RegisterEmail(firstname,lastname,email,password);
                              // vérification de notre bdd
                              if(result == null){
                                setState(() {
                                  error=true;
                                  loading=false;
                          //print(error);
                                });
                              }else{
                                print("register correctly");
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                return Home();
                              }));
                              }
                            }
                        }
                      ),

                      Text(error ? "vérifiez bien vos informations" : '' ,style: TextStyle(color: Colors.red,fontSize: 14))
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