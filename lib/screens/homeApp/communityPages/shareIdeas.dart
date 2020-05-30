import 'package:flutter/material.dart';

class ShareIdeas extends StatefulWidget {
  @override
  _ShareIdeasState createState() => _ShareIdeasState();
}
// cette page concerne les membres de la communauté qui veulent proposer des idées 
class _ShareIdeasState extends State<ShareIdeas> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: ListView(
            children: <Widget>[
              // chaque ListTile concerne un seul membre et contient un message ou une publication de sa part
              ListTile(
                leading: CircleAvatar(
                backgroundColor:Color(0xFF00AEAE),
                child: Text("mm",style: TextStyle(color: Colors.white),),
              ),
                title: Text("mahdaoui malia"),
                subtitle:Text("une application pour l'aide des diabetiques"),
              ),
              ListTile(
                leading: CircleAvatar(
                backgroundColor:Color(0xFF00AEAE),
                child: Text("ms",style: TextStyle(color: Colors.white),),
              ),
                title: Text("meghazi sofiane"),
                subtitle:Text("une application pour régler le sommeil"),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.all(10),
            child:FloatingActionButton.extended(
              onPressed: null, 
              label: Text('ajouter une idée'),
              backgroundColor: Color(0xFF00AEAE),
              elevation: 0,
              icon: Icon(Icons.live_help),
              )
          ),
        )
      ],
    );
  }
}