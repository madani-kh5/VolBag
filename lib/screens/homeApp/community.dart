import 'package:flutter/material.dart';
import 'package:principalHackathon/screens/homeApp/communityPages/shareApp.dart';
import 'package:principalHackathon/screens/homeApp/communityPages/shareIdeas.dart';
import 'package:principalHackathon/shared/bottomBar.dart';

// on cliquant sur la tocuhe ou le bouton communauté ca nous redirige vers cette page 
// c'est l'interface de la communauté
// on à deux principales pages 
class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {

  List<Widget> children=[
    ShareApp(),
    ShareIdeas()
   
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFF00AEAE),
        elevation: 0,
        leading: Container(),
        title: Text("Communauté"),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: <Widget>[
            // la premiere pages c'est pour nous contacter et proposer des minis apps
            Tab(
              text: 'Vos Mini Apps',
            ),
            // la deuxième c'est pour donner des idées
            Tab(
              text: 'Vos Idées',
            ),
          ]
        ),
      ),
      body: TabBarView(
        children: children
      ),
      bottomNavigationBar: BottomBarVol(),
      )
    );
  }
}