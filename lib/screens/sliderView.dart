import 'dart:io';
import 'package:flutter/material.dart';
import 'package:principalHackathon/models/slider.dart';
import 'package:principalHackathon/screens/login.dart';



class SliderView extends StatefulWidget {
   

  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {

  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex=0;
  PageController pageController=new PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    slides=getSlides();
  }

  Widget PageIndexIndicator(bool currentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: currentPage ? 6 : 4,
      width: currentPage ? 12 : 8,
      decoration: BoxDecoration(
        color: currentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12) 
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
        onPageChanged: (val){
          setState(() {
             currentIndex=val;
          });
        },
        itemBuilder: (context, index) {
          return SliderTile(
            imagePath: slides[index].getImagePath(),
            title:  slides[index].getTitle(),
            desc: slides[index].getDesc()
          );
        },
      ),
     bottomSheet: currentIndex != slides.length-1 ? Container(
       height: 60,
       padding: EdgeInsets.symmetric(horizontal: 20),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           GestureDetector(
             onTap: (){
               pageController.animateToPage(slides.length-1, duration: Duration(milliseconds: 400), curve: Curves.linear);
             },
             child: Text("SAUTER"),
           ),
           Row(
             children: <Widget>[
               for(var i = 0;i<slides.length ; i++) currentIndex == i ? PageIndexIndicator(true) : PageIndexIndicator(false)
             ],
           ),
           GestureDetector(
             onTap: (){
               pageController.animateToPage(currentIndex+1, duration: Duration(milliseconds: 400), curve: Curves.linear);
             },
             child: Text("SUIVANT"),
           )
         ],
       ),
     ) : Container(
          color:Color(0xFF00AEAE) ,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 60 ,
          child:GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                 return Login();
               }));
             },
             child: Text("COMMENCER MAINTENANT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
           )
          
     ) ,
    );
  }
}


class SliderTile extends StatelessWidget{
  String imagePath,title,desc;
  SliderTile({this.imagePath,this.title,this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagePath,height:300 ,width: 300,),
            SizedBox(height: 20,),
            Text(title,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
            )),
            SizedBox(height: 12,),
            Text(desc,textAlign: TextAlign.center,style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400
            ))
          ],
        ),
      );
  }
}