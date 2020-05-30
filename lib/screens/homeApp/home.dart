import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/emergencyApp/welcomeEm.dart';
import 'package:principalHackathon/screens/login.dart';
import 'package:principalHackathon/screens/medicalApp/welcomeMe.dart';
import 'package:principalHackathon/screens/servicesApp/welcomeSe.dart';
import 'package:principalHackathon/services/auth.dart';
import 'package:principalHackathon/shared/bottomBar.dart';

// c'est notre page principale qui conteint toutes les minis apps de notre appli
// pour l'instant on à 3
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ServiceAuth _auth=new ServiceAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00AEAE),
        elevation: 0,
        leading: Container(),
        actions: <Widget>[
          // un bouton pour la déconnexion de notre appli
          FlatButton.icon(
            onPressed: () async{
              // intéraction avec la base de données 
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
              color: Color(0xFF00AEAE),
            ),
          ),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Text("VolBag Application",textAlign: TextAlign.left, style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 30),
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search,color: Color(0xFF00AEAE)),
                      hintText: 'Recherche',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: InputBorder.none
                    ),
                  ),
                ),

                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: <Widget>[
                      // la premier bouton concerne notre premiere mini app , la carte d'urgence
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                            return WelcomeEm();
                          }));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                             borderRadius: BorderRadius.circular(13)
                            ),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/images/hospital.png",width:100 ,height:100 ,),
                                Text("Carte d'Urgence",style: TextStyle(color:Colors.white),)
                              ],
                            ),
                          ),
                      ),
                      // le deuxième concerne la main de la communauté , et ca pour échanger des services entre les membres de notre communauté
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                            return WelcomeSe();
                          }));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                             borderRadius: BorderRadius.circular(13)
                            ),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/images/service.png",width:100 ,height:100 ,),
                                Text("Mains de la Communauté",textAlign: TextAlign.center,style: TextStyle(color:Colors.white),)
                              ],
                            ),
                          ),
                      ),
                      // et la 3eme c'est pour l'aide médical 
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                            return WelcomeMe();
                          }));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                             borderRadius: BorderRadius.circular(13)
                            ),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/images/medical.png",width:100 ,height:100 ,),
                                Text("Main Médicale",style: TextStyle(color:Colors.white),)
                              ],
                            ),
                          ),
                      ),
                      GestureDetector(
                        onTap: (){
                         /* Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                            return ;
                          }));*/
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color:  Color(0xFF00AEAE),
                             borderRadius: BorderRadius.circular(13)
                            ),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/images/plus.png",width:100 ,height:100 ,),
                                Text("Encore",textAlign: TextAlign.center,style: TextStyle(color:Colors.white),)
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
      // la barre de navigation , bottom bar
      bottomNavigationBar: BottomBarVol(),
    );
  }
}