import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test/Screens/HomeScreen.dart';

class StartingAppScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StartingAppScreenState();
  }

}
class _StartingAppScreenState extends State<StartingAppScreen> with TickerProviderStateMixin{
  late  final  _controller;
  late  final CurvedAnimation _animation;
  late final  CurvedAnimation _c2;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2));
    _animation =CurvedAnimation(parent: _controller, curve: Curves.fastLinearToSlowEaseIn);
    _c2 =CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut);
  }

 

  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  void startAnimation()async {
    await _controller.forward();
    
    await _controller.reverse();
  
    Navigator.pushReplacement(context, 
    PageTransition(child:HomeScreen() ,type: PageTransitionType.fade,duration: const Duration(seconds: 1)));
  }
  @override
  Widget build(BuildContext context)  {
    
     startAnimation();
 // TODO: implement build
   
     return Scaffold(
        body: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.onBackground,
        child:
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleTransition(
                        scale: _animation,
                          child:  Row(
                            children: [
                              Text("Tic-Tac",
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 55,
                                  color: Theme.of(context).colorScheme.onInverseSurface
                                )),
                              const SizedBox(width: 20,),
                              Image.asset("assets/mainIcon.png",scale: 8,
                              )
                            ],
                          ),      
                   ),

                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ScaleTransition(
                    scale: _c2,
                    child: Text(
                      "Developed by Maher",
                      style:GoogleFonts.mPlus1(
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                      ) ,),)


                 ],
               ),
      
             ));
  
  }

}