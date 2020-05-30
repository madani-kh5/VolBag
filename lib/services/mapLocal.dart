import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
// google map pour la carte d'urgence , emergency map 

class MapLocal extends StatefulWidget {
  @override
  _MapLocalState createState() => _MapLocalState();
}

class _MapLocalState extends State<MapLocal> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  Location location=new Location();


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.774643, 3.064990),
    zoom: 12,
  );

  static final CameraPosition _algeria = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414)
      ;

  bool switchState=false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
         setState(() {
           mapController=controller;
         });
        },
      
      ),
       Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.all(10),
            child: FloatingActionButton(
              backgroundColor: switchState ? Colors.grey[400] : Colors.redAccent,
              child: Icon(Icons.my_location),
              elevation: 0,
              onPressed: switchState ? null : (){

                
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 10),
                    backgroundColor: Colors.white, 
                    
                    content: Text("Vous vous partager \n votre localisation en tant \n que volontaire",style: TextStyle(color: Colors.black),),
                    action: SnackBarAction(label: 'oui', onPressed: (){},)
                    
                  )
                );
                _animateToUser();

               // _getCurrentLocation();
              },
          ),
          ),
        ),

        Positioned(
        child:Container(
          margin: EdgeInsets.all(10),
          child: Switch(
            value: switchState, 
            activeColor: Colors.redAccent ,
            onChanged: (bool s) => switchCas(s) 
          ),
        ) ,
        top: 0,
        right: 0,
        
        )
      ],
    );



      
  }

  
  Future<void> _goToMyPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_algeria));
  }

 
  _animateToUser() async{
    var pos = await location.getLocation();
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(pos.latitude, pos.longitude),
        zoom: 17
      )
    )
  );
  }

  void switchCas(bool s){
    
    setState(() {
      if(s){
        switchState=true;
        s=true;
      }else{
        switchState=false;
        s=false;
      }
    });
  }


  
}