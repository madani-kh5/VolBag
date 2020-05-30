import 'package:flutter/material.dart';

class ShareApp extends StatefulWidget {
  @override
  _ShareAppState createState() => _ShareAppState();
}
// cette page concerne les développeurs qui veulent nous contactez pour nous aider à améliorer , en cliquant sur le bouton le développeur sera rediriger vers notre site web 
class _ShareAppState extends State<ShareApp> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30),
            child: Text("Si vous êtes un développeur et que vous voulez particiter et contribuer à améliorer et à ajouter des fonctionnalités a notre application au même ajouter des minis applications n'hésitez pas à nous contacter sur notre site en cliquant sur ce bouton ",textAlign: TextAlign.center,),
          ),
          Container(
            margin: EdgeInsets.all(30),
            // c'est le bouton qui concerne notre lien 
            child: RaisedButton(
                   color: Color(0xFF00AEAE),
                        elevation: 0,
                        highlightElevation: 0,
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                  onPressed: ()async{},
                  child:Text("Contactez-nous",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                ),
          )
        ],
      )
    );
    
  }
}