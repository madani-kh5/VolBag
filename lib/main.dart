import 'package:flutter/material.dart';
import 'package:principalHackathon/models/user.dart';
import 'package:principalHackathon/screens/splash.dart';
import 'package:principalHackathon/services/auth.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: ServiceAuth().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash()
      )
    );
  }
}

