import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/homeApp/home.dart';
import 'package:principalHackathon/screens/login.dart';
import 'package:principalHackathon/services/auth.dart';
import 'package:principalHackathon/shared/bottomBar.dart';

class HomeMe extends StatefulWidget {
  @override
  _HomeMeSeState createState() => _HomeMeSeState();
}

class _HomeMeSeState extends State<HomeMe> {
  ServiceAuth _auth=new ServiceAuth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blueAccent,
        elevation: 0,
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
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .35,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Text("Main Médicale",textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
                

                Expanded(
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(), 
                    padding: EdgeInsets.only(bottom: 20,left: 20,right: 20,top: 50),
                    crossAxisCount: 2,
                    childAspectRatio: 0.95,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          /*Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                            return Home();
                          }));*/
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(99, 179, 237, 0.3),
                                  blurRadius: 30,
                                  offset: Offset(0, 10)
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/phonem.png",width:100 ,height:100 ,),
                                Text("Consulter un patient",style: TextStyle(color:Colors.black),)
                              ],
                            ),
                          ),
                      ),
                      GestureDetector(
                        onTap: (){
                           /*Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                            return Home();
                          }));*/
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                             borderRadius: BorderRadius.circular(5),
                             boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(99, 179, 237, 0.3),
                                  blurRadius: 30,
                                  offset: Offset(0, 10)
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/doctor.png",width:100 ,height:100 ,),
                                Text("Trouver du personnel médical",textAlign: TextAlign.center,style: TextStyle(color:Colors.black),)
                              ],
                            ),
                          ),
                      ),
                      GestureDetector(
                        onTap: (){
                           /*Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                            return Home();
                          }));*/
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                             borderRadius: BorderRadius.circular(5),
                             boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(99, 179, 237, 0.3),
                                  blurRadius: 30,
                                  offset: Offset(0, 10)
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/insurance.png",width:100 ,height:100 ,),
                                Text("Remplir le dossier médical",textAlign: TextAlign.center,style: TextStyle(color:Colors.black),)
                              ],
                            ),
                          ),
                      ),
                      GestureDetector(
                        onTap: (){
                           /*Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                            return Home();
                          }));*/
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color:  Colors.white,
                             borderRadius: BorderRadius.circular(5),
                             boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(99, 179, 237, 0.3),
                                  blurRadius: 30,
                                  offset: Offset(0, 10)
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/phone.png",width:100 ,height:100 ,),
                                Text("Se Connecter en tant que personnel médical",textAlign: TextAlign.center,style: TextStyle(color:Colors.black),)
                              ],
                            ),
                          ),
                      )
                    ],
                  ),
                )
              ],
            ), 
          ),
        ],
      ),
      bottomNavigationBar: BottomBarVol(),
    );
  }
}