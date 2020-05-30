import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/login.dart';
import 'package:principalHackathon/services/auth.dart';
import 'package:principalHackathon/shared/bottomBar.dart';
// la page principale de notre application , main de la communauté 
class HomeSe extends StatefulWidget {
  @override
  _HomeSeState createState() => _HomeSeState();
}

class _HomeSeState extends State<HomeSe> {
  ServiceAuth _auth=new ServiceAuth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.orangeAccent,
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
              color: Colors.orangeAccent,
            ),
          ),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Text("Mains\n de la Communauté",textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
                

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
                                Image.asset("assets/images/collaboration.png",width:100 ,height:100 ,),
                                Text("Rendre un service",style: TextStyle(color:Colors.black),)
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
                                Image.asset("assets/images/team.png",width:100 ,height:100 ,),
                                Text("Association",style: TextStyle(color:Colors.black),)
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
                                Image.asset("assets/images/like.png",width:100 ,height:100 ,),
                                Text("Conseiller",style: TextStyle(color:Colors.black),)
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
                                Image.asset("assets/images/three.png",width:100 ,height:100 ,),
                                Text("Paramètres",style: TextStyle(color:Colors.black),)
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