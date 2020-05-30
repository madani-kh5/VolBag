import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// c'est un interface qui contient un Spinner en cas de récupération des données pour que l'utilisateur comprend 
// que notre appli est entraine de récupérer ou de chercher des données
class Loading extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitCubeGrid(
          color: Color(0xFF00AEAE),
          size: 50.0,
        ),
      ),
    );
  }
}